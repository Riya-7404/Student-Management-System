<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Role | SMS</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">

    <%@ include file="navbar.jsp" %>

    <main class="flex-grow pt-32 pb-20 px-6">
        <div class="container mx-auto max-w-4xl text-center">
            <h2 class="text-4xl font-black uppercase mb-12 tracking-tighter">Choose Your <span class="text-emerald-400">Portal</span></h2>
            
            <div class="grid md:grid-cols-2 gap-8">
                <a href="/signup-student" class="bg-white/5 border border-white/10 p-10 rounded-[3rem] hover:border-emerald-500 transition-all no-underline block group">
                    <i class="fas fa-user-graduate text-emerald-400 text-5xl mb-6 group-hover:scale-110 transition-transform"></i>
                    <h3 class="text-2xl font-bold uppercase">Student</h3>
                    <p class="text-gray-500 mt-2">Create profile to track your academic progress.</p>
                </a>

                <a href="/signup-admin" class="bg-white/5 border border-white/10 p-10 rounded-[3rem] hover:border-blue-500 transition-all no-underline block group">
                    <i class="fas fa-chalkboard-teacher text-blue-400 text-5xl mb-6 group-hover:scale-110 transition-transform"></i>
                    <h3 class="text-2xl font-bold uppercase">Administrator</h3>
                    <p class="text-gray-500 mt-2">Register as faculty to manage campus records.</p>
                </a>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>
</body>
</html>