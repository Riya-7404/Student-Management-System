<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Student Registration | SMS</title>
</head>
<body class="bg-[#0b0e11] text-white min-h-screen flex flex-col font-sans">
    <%@ include file="navbar.jsp" %>

    <main class="flex-grow pt-32 pb-20 flex items-center justify-center px-6">
        <div class="bg-[#121519] p-10 rounded-[3rem] border border-white/5 w-full max-w-lg shadow-2xl flex flex-col items-center">
            
            <div class="w-20 h-20 bg-emerald-500/10 rounded-3xl flex items-center justify-center border border-emerald-500/20 mb-6">
                <i class="fas fa-user-shield text-emerald-400 text-3xl"></i>
            </div>

            <div class="mb-10 text-center">
                <h2 class="text-4xl font-black uppercase tracking-tight italic leading-none">
                    Student <span class="text-emerald-400">Portal</span>
                </h2>
                <p class="text-gray-500 font-bold uppercase text-[10px] tracking-[0.4em] mt-3 opacity-60">
                    Authorized Academic Access
                </p>
            </div>

            <form action="/saveStudent" method="post" class="w-full space-y-6">
                <input type="hidden" name="roleType" value="student">

                <div class="space-y-2">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Full Name</label>
                    <input type="text" name="name" placeholder="Prof. John Doe" 
                           class="w-full bg-[#1c2128] border border-white/10 p-5 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm placeholder:text-gray-600" required>
                </div>

                <div class="space-y-2">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Academic Roll No</label>
                    <input type="text" name="rollNo" placeholder="Enter Roll Number" 
                           class="w-full bg-[#1c2128] border border-white/10 p-5 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm placeholder:text-gray-600" required>
                </div>

                <div class="space-y-2">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Official Email</label>
                    <input type="email" name="email" placeholder="admin@university.com" 
                           class="w-full bg-[#1c2128] border border-white/10 p-5 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm placeholder:text-gray-600" required>
                </div>

                <div class="space-y-2">
                    <label class="text-[10px] font-black uppercase tracking-widest text-emerald-400 ml-1">Create Password</label>
                    <input type="password" name="password" placeholder="••••••••" 
                           class="w-full bg-[#1c2128] border border-white/10 p-5 rounded-2xl outline-none focus:border-emerald-500/50 transition-all text-sm placeholder:text-gray-600" required>
                </div>

                <button type="submit" 
                    class="w-full bg-[#059669] hover:bg-[#10b981] py-5 rounded-2xl font-black text-[11px] uppercase tracking-[0.3em] shadow-xl shadow-emerald-900/10 transition-all mt-6 active:scale-[0.98]">
                    Verify & Create Account
                </button>
            </form>

            <div class="mt-10 text-center">
                <a href="/login?role=student" class="text-[10px] font-bold text-gray-500 uppercase tracking-widest hover:text-emerald-400 transition-colors">
                    Already have an account? <span class="text-emerald-400 underline underline-offset-4 ml-1">Login</span>
                </a>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>
</body>
</html>