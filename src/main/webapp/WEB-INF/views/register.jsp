<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>${role == 'admin' ? 'Faculty' : 'Student'} Registration | Mentor Mesh</title>
</head>
<body class="bg-[#0b0e11] text-white min-h-screen flex flex-col font-sans">
    
    <jsp:include page="navbar.jsp" />

    <main class="flex-grow pt-32 pb-20 flex items-center justify-center px-6">
        <div class="bg-[#121519] p-10 rounded-[3rem] border border-white/5 w-full max-w-lg shadow-2xl flex flex-col items-center">
            
            <div class="w-20 h-20 bg-emerald-500/10 rounded-3xl flex items-center justify-center border border-emerald-500/20 mb-6">
                <i class="fas ${role == 'admin' ? 'fa-user-shield' : 'fa-user-graduate'} text-emerald-400 text-3xl"></i>
            </div>

            <div class="mb-10 text-center">
                <h2 class="text-4xl font-black uppercase tracking-tight italic leading-none">
                    ${role == 'admin' ? 'Faculty' : 'Student'} <span class="text-emerald-400">Portal</span>
                </h2>
                <p class="text-gray-500 font-bold uppercase text-[10px] tracking-[0.4em] mt-3 opacity-60">
                    ${role == 'admin' ? 'Administrative' : 'Academic'} Enrollment
                </p>
            </div>

            <form action="/doRegister" method="post" class="w-full space-y-5">
                <input type="hidden" name="roleType" value="${role}">

                <div class="space-y-1">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Full Name</label>
                    <input type="text" name="name" placeholder="Enter Name" class="w-full bg-[#1c2128] border border-white/10 p-4 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm" required>
                </div>

                <div class="space-y-1">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">
                        ${role == 'admin' ? 'Faculty Identity ID' : 'Student Roll Number'}
                    </label>
                    <input type="text" name="rollNo" placeholder="ID Number" class="w-full bg-[#1c2128] border border-white/10 p-4 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm" required>
                </div>

                <div class="space-y-1">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Official Email</label>
                    <input type="email" name="email" placeholder="email@domain.com" class="w-full bg-[#1c2128] border border-white/10 p-4 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm" required>
                </div>

                <c:if test="${role == 'admin'}">
                <div class="space-y-1">
                    <label class="text-[10px] font-black uppercase tracking-widest text-orange-400 ml-1">Faculty Secret Key</label>
                    <input type="password" name="adminKey" placeholder="Enter ADMIN123" 
                           class="w-full bg-[#1c2128] border border-orange-500/30 p-4 rounded-2xl outline-none focus:border-orange-500 transition-all text-sm placeholder:text-orange-900/50 shadow-[0_0_15px_rgba(249,115,22,0.05)]" required>
                </div>
                </c:if>

                <div class="space-y-1">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Create Password</label>
                    <input type="password" name="password" placeholder="••••••••" class="w-full bg-[#1c2128] border border-white/10 p-4 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm" required>
                </div>

                <button type="submit" class="w-full bg-emerald-600 hover:bg-emerald-500 py-4 rounded-2xl font-black text-[11px] uppercase tracking-[0.3em] transition-all mt-4 shadow-lg shadow-emerald-900/20 active:scale-95">
                    Complete ${role == 'admin' ? 'Faculty' : 'Student'} Signup
                </button>
            </form>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>