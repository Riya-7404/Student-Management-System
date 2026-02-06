package com.example.student_management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.*;
import java.time.LocalDate;
import java.util.List;

@Controller
public class StudentController {

    @Autowired private StudentRepository repo;
    @Autowired private NoticeRepository noticeRepo;
    @Autowired private AttendanceRepository attendanceRepo; 

   
    @GetMapping("/") public String index() { return "index"; }
    @GetMapping("/login-selection") public String loginSelection() { return "login_selection"; }
    @GetMapping("/signup-selection") public String signupSelection() { return "signup_selection"; }

    @GetMapping("/login")
    public String loginPage(@RequestParam(value = "role", required = false) String role, Model model) {
        if (role == null) return "redirect:/login-selection";
        model.addAttribute("role", role);
        return "login";
    }

    @PostMapping("/doLogin")
    public String doLogin(@RequestParam String email, @RequestParam String password, @RequestParam String role, HttpSession session, RedirectAttributes ra) {
        Student s = repo.findByEmail(email);
        if (s != null && s.getPassword().equals(password)) {
            if (s.getRoleType().equalsIgnoreCase(role)) {
                session.setAttribute("user", s);
                return role.equalsIgnoreCase("admin") ? "redirect:/admin/dashboard" : "redirect:/dashboard";
            }
        }
        ra.addFlashAttribute("errorMsg", "Invalid credentials!");
        return "redirect:/login?role=" + role;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @GetMapping("/register")
    public String registerPage(@RequestParam(value = "role", required = false) String role, Model model) {
        if (role == null) return "redirect:/signup-selection";
        
        model.addAttribute("role", role); 
        return "register"; 
    }

    @PostMapping("/doRegister")
    public String doRegister(@ModelAttribute Student student, RedirectAttributes ra) {
        try {
            repo.save(student); 
            ra.addFlashAttribute("msg", "Registration Successful! Please Login.");
            return "redirect:/login?role=" + student.getRoleType();
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Registration Failed! Email might already exist.");
            return "redirect:/signup-selection";
        }
    }

    
    //   2. ADMIN DASHBOARD & SIDEBAR PAGES
    
    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        Student s = (Student) session.getAttribute("user");
        if (s == null || !s.getRoleType().equalsIgnoreCase("admin")) return "redirect:/login";
        model.addAttribute("students", repo.findAll());
        return "admin_dashboard";
    }

    @GetMapping("/admin/attendance-report")
    public String attendanceReport(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        List<Attendance> list = attendanceRepo.findAll();
        model.addAttribute("attendanceList", list); 
        return "attendance_report"; 
    }

    @GetMapping("/admin/assignments")
    public String viewAssignments(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        model.addAttribute("allStudentDocs", noticeRepo.findByStudentId(-1L));
        return "assignments_view"; 
    }

    @GetMapping("/admin/sent-history")
    public String sentHistory(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        model.addAttribute("allNotices", noticeRepo.findAll());
        return "sent_history"; 
    }

    
    //   3. ADMIN ACTIONS (SEND & DELETE)
    
    @PostMapping("/admin/sendNote")
    public String sendNote(@RequestParam("content") String content, 
                           @RequestParam(value = "studentId", defaultValue = "0") Long studentId,
                           @RequestParam("file") MultipartFile file, 
                           HttpSession session, RedirectAttributes ra) {
        try {
            Student admin = (Student) session.getAttribute("user");
            Notice n = new Notice();
            n.setContent(content); 
            n.setStudentId(studentId); 
            n.setSenderName(admin.getName());

            if (file != null && !file.isEmpty()) {
                String fName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path p = Paths.get("src/main/resources/static/uploads/" + fName);
                Files.createDirectories(p.getParent());
                Files.copy(file.getInputStream(), p, StandardCopyOption.REPLACE_EXISTING);
                n.setFileName(fName);
            } else { 
                n.setFileName("No Attachment"); 
            }
            
            noticeRepo.save(n);
            ra.addFlashAttribute("msg", "Sent Successfully!");
        } catch (IOException e) { 
            ra.addFlashAttribute("error", "Failed to send notice!"); 
        }
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/admin/deleteNote/{id}")
    public String deleteNote(@PathVariable Long id, RedirectAttributes ra) {
        try {
            noticeRepo.deleteById(id);
            ra.addFlashAttribute("msg", "Deleted Successfully!");
        } catch (Exception e) { 
            ra.addFlashAttribute("error", "Error deleting record!"); 
        }
        return "redirect:/admin/sent-history"; 
    }

   
    //   4. STUDENT DASHBOARD & LOGIC
    
    @GetMapping("/dashboard")
    public String studentDashboard(HttpSession session, Model model) {
        Student s = (Student) session.getAttribute("user");
        if (s == null) return "redirect:/login";

        List<Notice> notices = noticeRepo.findByStudentIdOrStudentIdOrderByCreatedAtDesc(s.getId(), 0L);
        long totalPresent = attendanceRepo.countByStudentId(s.getId());
        
        model.addAttribute("student", s);
        model.addAttribute("notices", notices);
        model.addAttribute("totalPresent", totalPresent);
        
        // Mock data for chart visualization
        model.addAttribute("attendanceData", new int[]{20, 45, 60, 80, (int)totalPresent * 5});
        return "dashboard";
    }

    @PostMapping("/student/markMyAttendance")
    public String selfAttendance(HttpSession session, RedirectAttributes ra) {
        Student s = (Student) session.getAttribute("user");
        if (s == null) return "redirect:/login";
        
        boolean alreadyMarked = attendanceRepo.existsByStudentIdAndDate(s.getId(), LocalDate.now());
        
        if(alreadyMarked) {
            ra.addFlashAttribute("error", "Attendance already marked for today!");
        } else {
            Attendance att = new Attendance();
            att.setStudentId(s.getId());
            att.setStudentName(s.getName());
            att.setStatus("Present");
            att.setDate(LocalDate.now()); 
            attendanceRepo.save(att);
            ra.addFlashAttribute("msg", "Attendance Marked Successfully!");
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/student/uploadAssignment")
    public String studentUpload(
            @RequestParam("file") MultipartFile file, 
            @RequestParam(value = "message", required = false) String message,
            HttpSession session, 
            RedirectAttributes ra) {
        
        Student s = (Student) session.getAttribute("user");
        if (s == null) return "redirect:/login";
        
        try {
            if (!file.isEmpty()) {
                String fName = s.getName().replace(" ", "_") + "_" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path p = Paths.get("src/main/resources/static/assignments/" + fName);
                Files.createDirectories(p.getParent());
                Files.copy(file.getInputStream(), p, StandardCopyOption.REPLACE_EXISTING);
                
                Notice doc = new Notice();
                
                if (message == null || message.trim().isEmpty()) {
                    doc.setContent("No description provided");
                } else {
                    doc.setContent(message);
                }
                
                doc.setFileName(fName); 
                doc.setSenderName(s.getName()); 
                doc.setStudentId(-1L); 
                noticeRepo.save(doc);
                
                ra.addFlashAttribute("msg", "Assignment Uploaded Successfully!");
            }
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Upload Failed!");
        }
        return "redirect:/dashboard";
    }
    
    @PostMapping("/contact-submit")
    public String handleContact(@RequestParam String name, 
                                @RequestParam String email, 
                                @RequestParam String message, 
                                HttpSession session, 
                                RedirectAttributes ra) {
        
        
        Student s = (Student) session.getAttribute("user");
        
        System.out.println("Contact Msg from: " + name);

        
        ra.addFlashAttribute("msg", "Message sent successfully!");

        
        if (s != null) {
            return "redirect:/dashboard";
        } else {
            return "redirect:/"; 
        }
    }
}