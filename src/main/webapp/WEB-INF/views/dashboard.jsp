<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Student Dashboard | Emerald SMS</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">

    <%@ include file="navbar.jsp"%>

    <main class="flex-grow container mx-auto px-6 pt-32 pb-20 relative">
        <div class="absolute top-0 right-0 w-96 h-96 bg-emerald-500/5 rounded-full blur-[100px] -z-10"></div>

        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-12 gap-6">
            <div>
                <%
                int hour = java.time.LocalTime.now().getHour();
                String greet = (hour >= 5 && hour < 17) ? "Good Morning" : "Good Evening";
                request.setAttribute("simpleGreet", greet);
                %>
                <h2 class="text-5xl font-black uppercase italic tracking-tighter">
                    <span class="text-gray-500">${simpleGreet},</span> 
                    <span class="text-emerald-400">${student.name}</span>
                </h2>
                <p class="text-gray-500 font-bold uppercase text-[10px] tracking-[0.3em] mt-3 flex items-center gap-2">
                    <span class="w-8 h-[1px] bg-emerald-500/30"></span> 
                    Roll No: ${student.rollNo} | Today: <%=java.time.LocalDate.now()%>
                </p>
            </div>

            <div class="relative w-full md:w-96">
                <i class="fas fa-search absolute left-5 top-1/2 -translate-y-1/2 text-emerald-400"></i>
                <input type="text" id="noticeSearch" placeholder="Search notices..."
                    class="w-full bg-white/5 border border-white/10 py-4 pl-14 pr-6 rounded-2xl outline-none focus:border-emerald-500 transition shadow-2xl">
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-10">
            <aside class="space-y-8">
                <div class="bg-white/[0.03] backdrop-blur-xl border border-white/10 p-8 rounded-[3rem] shadow-2xl text-center">
                    <h4 class="text-[10px] font-black uppercase tracking-widest text-emerald-400 mb-6 italic">Daily Check-in</h4>
                    <form action="/student/markMyAttendance" method="POST">
                        <button type="submit" class="bg-emerald-600 px-8 py-4 rounded-2xl font-black text-[10px] uppercase tracking-[0.2em] transition-all hover:bg-emerald-500 active:scale-95 w-full text-black">
                            <i class="fas fa-fingerprint mr-2"></i> Mark Attendance
                        </button>
                    </form>
                    <c:if test="${not empty msg}"><p class="mt-4 text-emerald-400 text-[9px] font-black uppercase animate-pulse">${msg}</p></c:if>
                    <c:if test="${not empty error}"><p class="mt-4 text-red-500 text-[9px] font-black uppercase">${error}</p></c:if>
                </div>

                <div class="bg-white/[0.03] border border-white/10 p-8 rounded-[3rem] shadow-2xl">
                    <h4 class="text-[10px] font-black uppercase tracking-widest text-blue-400 mb-6 text-center italic">Monthly Trend</h4>
                    <div class="h-40 relative">
                        <canvas id="attendanceChart"></canvas>
                    </div>
                    <p class="text-center text-[9px] text-gray-500 mt-4 font-bold uppercase tracking-widest">Total Present: ${totalPresent} Days</p>
                </div>

                <div class="bg-white/[0.03] border border-white/10 p-8 rounded-[3rem] shadow-2xl">
                    <h4 class="text-[10px] font-black uppercase tracking-widest text-emerald-400 mb-6 italic">
                        <i class="fas fa-file-upload mr-2"></i> Submit Assignment
                    </h4>
                    <form action="/student/uploadAssignment" method="POST" enctype="multipart/form-data" class="space-y-5">
                        <div>
                            <label class="text-[8px] text-gray-600 font-black uppercase tracking-[0.2em] mb-2 block ml-1">Optional Note</label>
                            <textarea name="message" rows="3" placeholder="Explain your submission..."
                                class="w-full bg-white/[0.02] border border-white/10 rounded-2xl p-4 text-[11px] text-gray-300 outline-none focus:border-emerald-500/40 transition-all resize-none shadow-inner"></textarea>
                        </div>
                        <div>
                            <label class="text-[8px] text-gray-600 font-black uppercase tracking-[0.2em] mb-2 block ml-1">Select File</label>
                            <input type="file" name="file" class="block w-full text-[10px] text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:bg-emerald-500/10 file:text-emerald-400 cursor-pointer" required>
                        </div>
                        <button type="submit" class="w-full bg-emerald-600 hover:bg-emerald-500 text-black font-black text-[10px] uppercase tracking-[0.2em] py-4 rounded-2xl transition-all active:scale-95 shadow-lg shadow-emerald-500/20">
                            Upload Now
                        </button>
                    </form>
                </div>
            </aside>

            <div class="lg:col-span-2 space-y-6">
                <h3 class="text-xs font-black uppercase tracking-[0.2em] mb-4 flex items-center gap-3 text-gray-400">
                    <i class="fas fa-bullhorn text-emerald-400"></i> Announcements
                </h3>
                <c:forEach var="n" items="${notices}">
                    <div class="notice-card p-8 bg-white/[0.03] border border-white/5 rounded-[2.5rem] hover:border-emerald-500/30 transition-all group">
                        <div class="flex items-center justify-between mb-4">
                            <span class="text-xs font-black text-white italic group-hover:text-emerald-400 transition-colors">${n.senderName}</span>
                            <span class="text-[8px] font-bold text-gray-700">#REF-${n.id}</span>
                        </div>
                        <p class="text-gray-300 text-sm leading-relaxed">${n.content}</p>
                        <c:if test="${not empty n.fileName}">
                            <div class="mt-4 pt-4 border-t border-white/5">
                                <a href="/uploads/${n.fileName}" download class="inline-block text-emerald-400 text-[10px] font-black uppercase tracking-widest hover:underline">
                                    <i class="fas fa-paperclip mr-1"></i> Download Attachment
                                </a>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp"%>

    <script>
        // Chart Fix: Added responsive and maintainAspectRatio
        const ctx = document.getElementById('attendanceChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['W1', 'W2', 'W3', 'W4', 'W5'],
                datasets: [{
                    data: [${attendanceData[0]}, ${attendanceData[1]}, ${attendanceData[2]}, ${attendanceData[3]}, ${attendanceData[4]}],
                    borderColor: '#10b981',
                    backgroundColor: 'rgba(16, 185, 129, 0.05)',
                    borderWidth: 2,
                    tension: 0.4,
                    fill: true,
                    pointRadius: 2,
                    pointBackgroundColor: '#10b981'
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true,
                plugins: { legend: { display: false } },
                scales: { 
                    y: { display: false, min: 0 }, 
                    x: { grid: { display: false }, ticks: { color: '#4b5563', font: { size: 8 } } } 
                }
            }
        });

        // Search Filter Script
        document.getElementById('noticeSearch').addEventListener('keyup', function() {
            let val = this.value.toLowerCase();
            document.querySelectorAll('.notice-card').forEach(card => {
                card.style.display = card.innerText.toLowerCase().includes(val) ? 'block' : 'none';
            });
        });
    </script>
</body>
</html>