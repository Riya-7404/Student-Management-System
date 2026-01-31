<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Sent History | Admin</title>
</head>
<body class="bg-[#010409] text-white">
    <%@ include file="navbar.jsp" %>
    
    <main class="container mx-auto px-6 pt-32 pb-20">
        <div class="flex justify-between items-center mb-12">
            <div>
                <h2 class="text-3xl font-black italic uppercase">Sent <span class="text-red-500">History</span></h2>
                <p class="text-[10px] text-gray-500 font-bold tracking-widest mt-1">MANAGE ALL BROADCASTS & PRIVATE NOTES</p>
            </div>
            <a href="/admin/dashboard" class="bg-white/5 border border-white/10 px-6 py-3 rounded-2xl text-[10px] font-black uppercase hover:bg-white/10 transition">
                <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
            </a>
        </div>

        <div class="bg-white/[0.02] border border-white/10 rounded-[3rem] overflow-hidden shadow-2xl">
            <table class="w-full text-left">
                <thead class="bg-white/5 text-[10px] font-black uppercase text-gray-500 tracking-widest">
                    <tr>
                        <th class="p-8">Type</th>
                        <th class="p-8">Message Content</th>
                        <th class="p-8 text-right">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-white/5">
                    <c:forEach var="n" items="${allNotices}">
                        <c:if test="${n.studentId >= 0}">
                            <tr class="hover:bg-white/[0.02] transition-all group">
                                <td class="p-8">
                                    <span class="px-3 py-1 rounded-lg text-[9px] font-black border ${n.studentId == 0 ? 'bg-emerald-500/10 text-emerald-400 border-emerald-500/20' : 'bg-blue-500/10 text-blue-400 border-blue-500/20'}">
                                        ${n.studentId == 0 ? 'GLOBAL' : 'PRIVATE'}
                                    </span>
                                </td>
                                <td class="p-8">
                                    <p class="text-sm font-medium text-gray-300 leading-relaxed">${n.content}</p>
                                    <div class="flex gap-4 mt-2">
                                        <c:if test="${n.fileName != 'No Attachment'}">
                                            <span class="text-[9px] text-blue-400 font-bold uppercase"><i class="fas fa-paperclip mr-1"></i> ${n.fileName}</span>
                                        </c:if>
                                        <span class="text-[9px] text-gray-600 font-bold uppercase italic">${n.createdAt}</span>
                                    </div>
                                </td>
                                <td class="p-8 text-right">
                                    <a href="/admin/deleteNote/${n.id}" 
                                       class="inline-flex items-center justify-center w-12 h-12 bg-red-500/10 text-red-500 rounded-2xl hover:bg-red-500 hover:text-white transition-all shadow-lg shadow-red-900/20"
                                       onclick="return confirm('Are you sure you want to permanently delete this message?')">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
           
        </div>
        <%@ include file="footer.jsp" %>
    </main>
</body>
</html>