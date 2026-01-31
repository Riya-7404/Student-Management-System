<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Portal | SMS</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">
    <%@ include file="navbar.jsp" %>
    <main class="flex-grow pt-40 pb-20 px-6 flex justify-center items-center">
        <div class="container max-w-5xl text-center">
            <h2 class="text-5xl font-black uppercase italic tracking-tighter mb-16">Choose Your <span class="text-emerald-400">Portal</span></h2>
            <div class="grid md:grid-cols-2 gap-10">
                <div class="bg-white/5 border border-white/10 p-12 rounded-[3.5rem] hover:border-emerald-500 transition-all group">
                    <i class="fas fa-user-graduate text-emerald-400 text-6xl mb-6 group-hover:scale-110 transition-transform"></i>
                    <h3 class="text-3xl font-black uppercase mb-4">Student</h3>
                    <div class="flex flex-col gap-4">
                        <a href="/login?role=student" class="bg-emerald-600 py-4 rounded-2xl font-bold text-xs uppercase text-white no-underline">Login</a>
                        <a href="/register?role=student" class="text-gray-500 hover:text-emerald-400 font-bold text-[10px] uppercase no-underline transition">New Student? Register</a>
                    </div>
                </div>
                <div class="bg-white/5 border border-white/10 p-12 rounded-[3.5rem] hover:border-blue-500 transition-all group">
                    <i class="fas fa-user-shield text-blue-400 text-6xl mb-6 group-hover:scale-110 transition-transform"></i>
                    <h3 class="text-3xl font-black uppercase mb-4">Teacher</h3>
                    <div class="flex flex-col gap-4">
                        <a href="/login?role=admin" class="bg-blue-600 py-4 rounded-2xl font-bold text-xs uppercase text-white no-underline">Login</a>
                        <a href="/register?role=admin" class="text-gray-500 hover:text-blue-400 font-bold text-[10px] uppercase no-underline transition">Faculty Signup</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@ include file="footer.jsp" %>
</body>
</html>