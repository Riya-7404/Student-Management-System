<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Teacher Registration | Management System</title>
</head>
<body class="bg-[#010409] min-h-screen flex flex-col text-white">

    <%@ include file="navbar.jsp" %>

    <main class="flex-grow flex items-center justify-center p-6 pt-32 pb-20 relative overflow-hidden">
        
        <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-emerald-500/5 rounded-full blur-[120px] -z-10"></div>

        <div class="bg-white/5 backdrop-blur-2xl border border-white/10 p-8 md:p-12 rounded-[3rem] shadow-2xl w-full max-w-lg relative border-t-4 border-emerald-500">
            
            <div class="text-center mb-10">
                <div class="inline-block p-4 bg-emerald-500/10 rounded-3xl mb-4 text-emerald-400 border border-emerald-500/20">
                    <i class="fas fa-user-shield text-3xl"></i>
                </div>
                <h2 class="text-3xl font-black text-white uppercase tracking-tighter">Faculty <span class="text-emerald-400">Portal</span></h2>
                <p class="text-gray-500 text-[10px] font-black uppercase tracking-[0.2em] mt-2">Authorized Administrator Access</p>
            </div>

            <c:if test="${not empty error}">
                <div class="bg-red-500/10 border border-red-500/20 text-red-400 p-4 rounded-xl mb-6 text-xs font-bold text-center">
                    <i class="fas fa-exclamation-circle mr-2"></i> ${error}
                </div>
            </c:if>

            <form action="/saveAdmin" method="post" class="space-y-6">
                <div class="grid grid-cols-1 gap-5">
                    <div>
                        <label class="text-[9px] font-black text-emerald-400 uppercase ml-1 tracking-widest mb-2 block">Full Name</label>
                        <input type="text" name="name" placeholder="Prof. John Doe" 
                               class="w-full bg-white/5 border border-white/10 p-4 rounded-2xl text-white outline-none focus:border-emerald-500 transition placeholder:text-gray-600" required>
                    </div>

                    <div>
                        <label class="text-[9px] font-black text-emerald-400 uppercase ml-1 tracking-widest mb-2 block">Official Email</label>
                        <input type="email" name="email" placeholder="admin@university.com" 
                               class="w-full bg-white/5 border border-white/10 p-4 rounded-2xl text-white outline-none focus:border-emerald-500 transition placeholder:text-gray-600" required>
                    </div>

                    <div>
                        <label class="text-[9px] font-black text-amber-400 uppercase ml-1 tracking-widest mb-2 block">Admin Security Key</label>
                        <div class="relative">
                            <input type="password" name="adminKey" placeholder="Enter Secret Code" 
                                   class="w-full bg-white/5 border border-amber-500/30 p-4 rounded-2xl text-white outline-none focus:border-amber-500 transition shadow-[0_0_20px_rgba(245,158,11,0.05)] placeholder:text-gray-700" required>
                            <i class="fas fa-key absolute right-5 top-1/2 -translate-y-1/2 text-amber-500/30"></i>
                        </div>
                        <p class="text-[8px] text-gray-600 mt-2 ml-1 italic">*Required for university verification.</p>
                    </div>
                    
                    <div>
                        <label class="text-[9px] font-black text-emerald-400 uppercase ml-1 tracking-widest mb-2 block">Create Password</label>
                        <input type="password" name="password" placeholder="••••••••" 
                               class="w-full bg-white/5 border border-white/10 p-4 rounded-2xl text-white outline-none focus:border-emerald-500 transition placeholder:text-gray-600" required>
                    </div>
                </div>

                <button type="submit" class="w-full bg-emerald-600 text-white py-5 rounded-2xl font-black uppercase text-xs tracking-[0.2em] hover:bg-emerald-500 shadow-xl shadow-emerald-900/40 transition-all active:scale-95 mt-4">
                    Verify & Create Account
                </button>
            </form>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

</body>
</html>