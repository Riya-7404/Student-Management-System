<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Login Selection | SMS</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">
    <%-- Navbar including 4 items --%>
    <%@ include file="navbar.jsp" %>

    <main class="flex-grow pt-48 flex flex-col items-center px-6">
        <h2 class="text-5xl font-black uppercase italic mb-16 tracking-tighter text-center">
            Login To <span class="text-emerald-400">Portal</span>
        </h2>
        
        <div class="flex flex-col md:flex-row gap-10 mb-20">
            <div class="bg-white/5 p-12 rounded-[3.5rem] border border-white/10 w-80 md:w-96 text-center hover:border-emerald-500 transition-all group">
                <i class="fas fa-user-graduate text-emerald-400 text-6xl mb-6 group-hover:scale-110 transition-transform"></i>
                <h3 class="text-3xl font-black mb-10 italic">STUDENT</h3>
                <a href="/login?role=student" class="block bg-emerald-600 py-4 rounded-2xl font-bold no-underline text-white uppercase tracking-widest hover:bg-emerald-500 transition">Login</a>
            </div>

            <div class="bg-white/5 p-12 rounded-[3.5rem] border border-white/10 w-80 md:w-96 text-center hover:border-blue-500 transition-all group">
                <i class="fas fa-user-shield text-blue-400 text-6xl mb-6 group-hover:scale-110 transition-transform"></i>
                <h3 class="text-3xl font-black mb-10 italic">TEACHER</h3>
                <a href="/login?role=admin" class="block bg-blue-600 py-4 rounded-2xl font-bold no-underline text-white uppercase tracking-widest hover:bg-blue-500 transition">Login</a>
            </div>
        </div>
    </main>

    <%-- Footer inclusion --%>
    <%@ include file="footer.jsp" %>
</body>
</html>