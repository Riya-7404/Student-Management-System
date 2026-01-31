<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Attendance Report | Faculty Portal</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col selection:bg-emerald-500/30">

    <%@ include file="navbar.jsp" %>

    <main class="flex-grow container mx-auto px-6 pt-32 pb-20 relative">
        <div class="absolute top-0 right-0 w-96 h-96 bg-emerald-500/5 rounded-full blur-[120px] -z-10"></div>

        <div class="flex flex-col md:flex-row justify-between items-end mb-12 gap-6 border-b border-white/5 pb-10">
            <div>
                <h2 class="text-5xl font-black uppercase tracking-tighter italic leading-none">
                    Attendance <span class="text-emerald-400">Report</span>
                </h2>
                <p class="text-gray-500 font-bold uppercase text-[10px] tracking-[0.4em] mt-4 flex items-center gap-2">
                    <span class="w-8 h-[1px] bg-emerald-500/50"></span>
                    Verified Student Presence Records
                </p>
            </div>
            
            <a href="/admin/dashboard" class="group flex items-center gap-4 bg-white/5 border border-white/10 px-6 py-3 rounded-2xl hover:border-emerald-500/50 transition-all shadow-xl">
                <div class="text-right">
                    <p class="text-[8px] font-black text-gray-500 uppercase tracking-widest">Back To</p>
                    <p class="text-[10px] font-bold text-white uppercase tracking-wider">Dashboard</p>
                </div>
                <div class="w-10 h-10 bg-emerald-500/10 rounded-xl flex items-center justify-center group-hover:bg-emerald-500 transition-colors">
                    <i class="fas fa-arrow-left text-emerald-400 group-hover:text-black text-sm"></i>
                </div>
            </a>
        </div>

        <div class="bg-white/[0.02] backdrop-blur-3xl border border-white/5 rounded-[3.5rem] shadow-2xl overflow-hidden">
            <div class="overflow-x-auto p-10">
                <table class="w-full text-left">
                    <thead>
                        <tr class="border-b border-white/10">
                            <th class="pb-8 text-[11px] font-black uppercase tracking-[0.3em] text-emerald-400/70">Student Name</th>
                            <th class="pb-8 text-[11px] font-black uppercase tracking-[0.3em] text-emerald-400/70">Marked Date</th>
                            <th class="pb-8 text-[11px] font-black uppercase tracking-[0.3em] text-emerald-400/70 text-right">Status</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-white/5">
                        <c:forEach var="att" items="${attendanceList}">
                            <tr class="group hover:bg-white/[0.03] transition-all">
                                <td class="py-6">
                                    <div class="flex items-center gap-4">
                                        <div class="w-12 h-12 bg-white/5 rounded-2xl flex items-center justify-center border border-white/10 group-hover:border-emerald-500/50 transition-all">
                                            <i class="fas fa-user-check text-gray-500 group-hover:text-emerald-400"></i>
                                        </div>
                                        <div>
                                            <p class="text-xs font-black text-gray-200 uppercase tracking-wider">${att.studentName}</p>
                                            <p class="text-[8px] text-gray-600 font-bold uppercase tracking-tighter">Verified System Log</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="py-6">
                                    <span class="text-sm text-gray-400 font-mono font-bold italic">${att.date}</span>
                                </td>
                                <td class="py-6 text-right">
                                    <span class="inline-flex items-center bg-emerald-500/5 text-emerald-400 border border-emerald-500/20 px-6 py-2.5 rounded-2xl text-[10px] font-black uppercase tracking-widest">
                                        <span class="w-2 h-2 bg-emerald-400 rounded-full mr-2 animate-pulse"></span>
                                        ${att.status}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty attendanceList}">
                            <tr>
                                <td colspan="3" class="py-40 text-center">
                                    <div class="w-20 h-20 bg-white/5 rounded-full flex items-center justify-center mx-auto mb-6">
                                        <i class="fas fa-calendar-times text-3xl text-gray-800"></i>
                                    </div>
                                    <p class="text-gray-600 font-black uppercase tracking-[0.5em] text-[10px]">No Records Found</p>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

</body>
</html>