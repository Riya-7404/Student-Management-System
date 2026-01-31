<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Student Signup</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">
    <%@ include file="navbar.jsp" %>
    <div class="flex-grow pt-32 pb-20 flex items-center justify-center p-6">
        <div class="bg-white/10 backdrop-blur-xl border border-white/10 p-10 rounded-[3rem] shadow-2xl w-full max-w-lg">
            <h2 class="text-3xl font-black uppercase text-center mb-8">Student <span class="text-emerald-400">Signup</span></h2>
            <form action="/saveStudent" method="post" class="space-y-4">
                <div class="grid grid-cols-2 gap-4">
                    <input type="text" name="name" placeholder="Name" class="bg-white/5 border border-white/10 p-4 rounded-xl outline-none focus:border-emerald-500" required>
                    <input type="text" name="rollNo" placeholder="Roll No" class="bg-white/5 border border-white/10 p-4 rounded-xl outline-none focus:border-emerald-500" required>
                </div>
                <input type="email" name="email" placeholder="Email" class="w-full bg-white/5 border border-white/10 p-4 rounded-xl outline-none focus:border-emerald-500" required>
                <input type="password" name="password" placeholder="Password" class="w-full bg-white/5 border border-white/10 p-4 rounded-xl outline-none focus:border-emerald-500" required>
                <button type="submit" class="w-full bg-emerald-600 py-4 rounded-2xl font-black uppercase tracking-widest hover:bg-emerald-500 transition-all">Register Student</button>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>