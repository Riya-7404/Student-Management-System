<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Student Submissions | Admin</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">

    <%@ include file="navbar.jsp" %>

    <main class="flex-grow container mx-auto px-6 pt-32 pb-20 relative">
        <div class="absolute top-0 left-0 w-96 h-96 bg-blue-600/5 rounded-full blur-[120px] -z-10"></div>

        <div class="flex flex-col md:flex-row justify-between items-end mb-12 gap-6 border-b border-white/5 pb-10">
            <div>
                <h2 class="text-5xl font-black uppercase tracking-tighter italic leading-none">
                    Student <span class="text-blue-400">Submissions</span>
                </h2>
                <p class="text-gray-500 font-bold uppercase text-[10px] tracking-[0.4em] mt-4 flex items-center gap-2">
                    <span class="w-8 h-[1px] bg-blue-500/50"></span>
                    Review Student Uploaded Files & Notes
                </p>
            </div>
            
            <a href="/admin/dashboard" class="flex items-center gap-4 bg-white/5 border border-white/10 px-6 py-3 rounded-2xl hover:border-blue-500/50 transition-all">
                <p class="text-[10px] font-bold text-white uppercase tracking-wider">Back to Dashboard</p>
            </a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <c:forEach var="doc" items="${allStudentDocs}">
                <div class="bg-white/[0.02] backdrop-blur-3xl border border-white/10 p-8 rounded-[2.5rem] hover:border-blue-500/40 transition-all group relative overflow-hidden">
                    
                    <div class="relative z-10">
                        <div class="flex items-center gap-5 mb-6">
                            <div class="w-14 h-14 rounded-2xl bg-blue-500/10 flex items-center justify-center text-blue-400 border border-blue-500/20 font-black text-xl uppercase">
                                ${doc.senderName.substring(0,1)}
                            </div>
                            <div>
                                <h4 class="font-black uppercase tracking-tight text-white">${doc.senderName}</h4>
                                <p class="text-[9px] text-gray-600 font-bold uppercase tracking-widest mt-1 italic">#REF-${doc.id}</p>
                            </div>
                        </div>

                        <div class="bg-white/[0.02] p-5 rounded-3xl border border-white/5 mb-4">
                            <p class="text-[8px] font-black text-blue-400 uppercase mb-2 tracking-widest italic">Student's Note:</p>
                            <p class="text-[12px] text-gray-300 leading-relaxed italic">
                                "${not empty doc.content ? doc.content : 'No additional description provided.'}"
                            </p>
                        </div>

                        <div class="bg-black/40 p-5 rounded-3xl border border-white/5 mb-6">
                            <p class="text-[8px] font-black text-gray-500 uppercase mb-2">Attached File:</p>
                            <p class="text-[10px] text-emerald-400 font-bold truncate">
                                <i class="fas fa-file-alt mr-2"></i>${doc.fileName}
                            </p>
                        </div>

                        <div class="flex gap-3">
                            <a href="/assignments/${doc.fileName}" target="_blank" 
                               class="flex-grow bg-blue-600 hover:bg-blue-500 text-white py-4 rounded-2xl text-[10px] font-black uppercase text-center transition-all shadow-lg shadow-blue-600/20">
                                View File
                            </a>
                            <a href="/assignments/${doc.fileName}" download 
                               class="bg-white/5 hover:bg-white/10 text-white px-5 rounded-2xl border border-white/10 flex items-center justify-center transition-all">
                                <i class="fas fa-download"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <c:if test="${empty allStudentDocs}">
            <div class="text-center py-40 border-2 border-dashed border-white/5 rounded-[4rem]">
                <i class="fas fa-inbox text-4xl text-gray-800 mb-6"></i>
                <p class="text-gray-600 font-black uppercase text-xs tracking-[0.5em]">No Submissions Found</p>
            </div>
        </c:if>
    </main>

    <%@ include file="footer.jsp" %>
</body>
</html>