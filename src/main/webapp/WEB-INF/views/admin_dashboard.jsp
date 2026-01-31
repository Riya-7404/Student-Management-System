<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Teacher Dashboard</title>
</head>
<body class="bg-[#010409] text-white">

    <%@ include file="navbar.jsp" %>

    <div id="sidebar" class="fixed inset-y-0 left-0 w-72 bg-[#0d1117] border-r border-white/10 z-[100] transform -translate-x-full transition-transform duration-300">
        <div class="p-8">
            <h3 class="text-emerald-400 font-black text-xl mb-10 italic">FACULTY MENU</h3>
            <nav class="space-y-4">
                <a href="/admin/dashboard" class="flex items-center gap-4 p-4 bg-emerald-500/10 text-emerald-400 rounded-2xl">
                    <i class="fas fa-home"></i> <span class="text-[10px] font-black uppercase tracking-widest">Dashboard</span>
                </a>
                <a href="/admin/attendance-report" class="flex items-center gap-4 p-4 text-gray-400 hover:text-white hover:bg-white/5 rounded-2xl transition">
                    <i class="fas fa-calendar-check"></i> <span class="text-[10px] font-black uppercase tracking-widest">Attendance Report</span>
                </a>
                <a href="/admin/assignments" class="flex items-center gap-4 p-4 text-gray-400 hover:text-white hover:bg-white/5 rounded-2xl transition">
                    <i class="fas fa-file-download"></i> <span class="text-[10px] font-black uppercase tracking-widest">Student Files</span>
                </a>
                
                <a href="/admin/sent-history" class="flex items-center gap-4 p-4 text-red-400/80 hover:text-white hover:bg-red-500/10 rounded-2xl transition border border-dashed border-red-500/20">
                    <i class="fas fa-history"></i> <span class="text-[10px] font-black uppercase tracking-widest">Sent History / Delete</span>
                </a>

                <div class="pt-10 border-t border-white/5">
                    <a href="/logout" class="flex items-center gap-4 p-4 text-red-500/60 hover:text-red-400 transition">
                        <i class="fas fa-power-off"></i> <span class="text-[10px] font-black uppercase tracking-widest">Logout</span>
                    </a>
                </div>
            </nav>
        </div>
    </div>

    <main class="container mx-auto px-6 pt-32 pb-20">
        
        <div class="flex items-center gap-6 mb-12">
            <button onclick="toggleSidebar()" class="bg-white/5 border border-white/10 p-5 rounded-3xl hover:bg-emerald-600 transition-all shadow-lg">
                <i class="fas fa-bars text-xl text-emerald-400 hover:text-white"></i>
            </button>
            <h2 class="text-4xl font-black italic uppercase italic">Teacher <span class="text-emerald-400">Dashboard</span></h2>
        </div>

        <div class="bg-white/[0.03] border border-white/10 p-10 rounded-[3rem] shadow-2xl mb-12">
            <h3 class="text-xs font-black uppercase tracking-widest text-emerald-400 mb-8 italic">Broadcast to All Students</h3>
            <form action="/admin/sendNote" method="post" enctype="multipart/form-data" class="flex flex-col lg:flex-row gap-4">
                <input type="hidden" name="studentId" value="0">
                <input type="text" name="content" placeholder="Type a global announcement..." required 
                       class="flex-grow bg-black/40 border border-white/10 p-5 rounded-2xl outline-none focus:border-emerald-500 text-sm">
                
                <label class="bg-white/5 border border-white/10 px-8 py-5 rounded-2xl cursor-pointer hover:bg-white/10 transition text-gray-400 text-[10px] font-black uppercase flex items-center gap-3">
                    <i class="fas fa-paperclip text-emerald-500"></i> <span id="gFile">Attach</span>
                    <input type="file" name="file" class="hidden" onchange="document.getElementById('gFile').innerText = 'Ready'">
                </label>
                
                <button type="submit" class="bg-emerald-600 px-10 py-5 rounded-2xl font-black text-[10px] uppercase hover:bg-emerald-500 transition-all shadow-xl">
                    Send All
                </button>
            </form>
        </div>

        <div class="bg-white/[0.02] border border-white/10 rounded-[3rem] overflow-hidden shadow-xl">
            <div class="p-8 border-b border-white/5 bg-white/5">
                <h3 class="text-xs font-black uppercase tracking-widest text-blue-400 italic">Individual Student Message</h3>
            </div>
            <table class="w-full text-left border-collapse">
                <tbody class="divide-y divide-white/5">
                    <c:forEach var="s" items="${students}">
                        <c:if test="${s.roleType == 'student'}">
                            <tr class="hover:bg-white/[0.02] transition-all">
                                <td class="p-8">
                                    <p class="font-black text-sm uppercase italic">${s.name}</p>
                                    <p class="text-[9px] text-gray-500 mt-1 uppercase">ID: ${s.id}</p>
                                </td>
                                <td class="p-8">
                                    <form action="/admin/sendNote" method="post" enctype="multipart/form-data" class="flex gap-3">
                                        <input type="hidden" name="studentId" value="${s.id}">
                                        <input type="text" name="content" placeholder="Send private note..." 
                                               class="bg-black/40 border border-white/5 p-4 rounded-xl text-xs w-full focus:border-blue-500 outline-none">
                                        <button type="submit" class="bg-blue-600/10 text-blue-400 border border-blue-500/20 px-6 py-2 rounded-xl text-[10px] font-black uppercase hover:bg-blue-600 hover:text-white transition-all">
                                            Send
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
<%@ include file="footer.jsp" %>
    <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('-translate-x-full');
        }
    </script>
</body>
</html>