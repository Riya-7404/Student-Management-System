<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Signup Selection | Emerald SMS</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">

    <%@ include file="navbar.jsp" %>

    <main class="flex-grow pt-48 flex flex-col items-center px-6 relative">
        <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-emerald-500/10 rounded-full blur-[120px] -z-10"></div>
        <div class="absolute bottom-1/4 right-1/4 w-96 h-96 bg-blue-500/10 rounded-full blur-[120px] -z-10"></div>

        <h2 class="text-5xl md:text-6xl font-black uppercase italic mb-4 tracking-tighter text-center">
            Join Our <span class="text-emerald-400 text-glow">Portal</span>
        </h2>
        <p class="text-gray-500 font-bold uppercase text-[10px] tracking-[0.4em] mb-16 text-center">
            Select your role to start your journey
        </p>

        <div class="flex flex-col md:flex-row gap-10 mb-20">
            
            <div class="group bg-white/[0.03] backdrop-blur-xl p-12 rounded-[3.5rem] border border-white/10 w-80 md:w-96 text-center hover:border-emerald-500/50 hover:bg-white/[0.05] transition-all duration-500 shadow-2xl relative overflow-hidden">
                <div class="absolute top-0 right-0 p-6 opacity-10 group-hover:opacity-20 transition-opacity">
                    <i class="fas fa-graduation-cap text-8xl -rotate-12"></i>
                </div>
                
                <div class="relative z-10">
                    <div class="w-20 h-20 bg-emerald-500/10 rounded-3xl flex items-center justify-center mx-auto mb-8 border border-emerald-500/20 group-hover:scale-110 transition-transform">
                        <i class="fas fa-user-graduate text-emerald-400 text-4xl"></i>
                    </div>
                    <h3 class="text-3xl font-black mb-2 tracking-tight uppercase italic">Student</h3>
                    <p class="text-[9px] text-gray-500 font-bold uppercase tracking-widest mb-10">Access Dashboard & Notices</p>
                    
                    <a href="/register?role=student" class="block w-full bg-emerald-600 hover:bg-emerald-500 py-5 rounded-2xl font-black text-white no-underline uppercase text-[10px] tracking-[0.2em] shadow-[0_10px_20px_rgba(16,185,129,0.2)] active:scale-95 transition-all">
                        Register Now
                    </a>
                </div>
            </div>

            <div class="group bg-white/[0.03] backdrop-blur-xl p-12 rounded-[3.5rem] border border-white/10 w-80 md:w-96 text-center hover:border-blue-500/50 hover:bg-white/[0.05] transition-all duration-500 shadow-2xl relative overflow-hidden">
                <div class="absolute top-0 right-0 p-6 opacity-10 group-hover:opacity-20 transition-opacity">
                    <i class="fas fa-chalkboard-teacher text-8xl -rotate-12"></i>
                </div>

                <div class="relative z-10">
                    <div class="w-20 h-20 bg-blue-500/10 rounded-3xl flex items-center justify-center mx-auto mb-8 border border-blue-500/20 group-hover:scale-110 transition-transform">
                        <i class="fas fa-user-shield text-blue-400 text-4xl"></i>
                    </div>
                    <h3 class="text-3xl font-black mb-2 tracking-tight uppercase italic">Faculty</h3>
                    <p class="text-[9px] text-gray-500 font-bold uppercase tracking-widest mb-10">Broadcast & Manage Students</p>
                    
                    <a href="/register?role=admin" class="block w-full bg-blue-600 hover:bg-blue-500 py-5 rounded-2xl font-black text-white no-underline uppercase text-[10px] tracking-[0.2em] shadow-[0_10px_20px_rgba(37,99,235,0.2)] active:scale-95 transition-all">
                        Faculty Signup
                    </a>
                </div>
            </div>

        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <style>
        .text-glow {
            text-shadow: 0 0 20px rgba(16, 185, 129, 0.4);
        }
    </style>
</body>
</html>