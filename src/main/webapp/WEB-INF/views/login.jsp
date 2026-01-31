<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Login | SMS</title>
</head>
<body class="bg-[#010409] text-white min-h-screen flex flex-col">
    <%@ include file="navbar.jsp" %>

   <main class="flex-grow pt-48 pb-20 flex items-center justify-center px-6">
    <div class="bg-white/5 p-10 rounded-[2.5rem] w-full max-w-md border border-white/10 shadow-2xl">
        
        <c:set var="themeColor" value="${param.role == 'admin' ? 'blue-500' : 'emerald-400'}" />
        <c:set var="btnColor" value="${param.role == 'admin' ? 'bg-blue-600' : 'bg-emerald-600'}" />

        <h2 class="text-3xl font-black uppercase italic text-center mb-8 text-${themeColor}">
            <c:out value="${not empty loginTitle ? loginTitle : (param.role == 'admin' ? 'Admin Login' : 'Student Login')}" />
        </h2>

        <%-- ERROR MESSAGE: Wrong Password or Email Not Found --%>
        <c:if test="${not empty errorMsg}">
            <div class="mb-6 p-4 bg-red-500/10 border border-red-500/20 rounded-2xl text-center animate-pulse">
                <p class="text-red-500 text-[10px] font-black uppercase tracking-widest italic">
                    <i class="fas fa-exclamation-circle mr-2"></i> ${errorMsg}
                </p>
            </div>
        </c:if>

        <%-- SUCCESS MESSAGE: After Signup --%>
        <c:if test="${not empty msg}">
            <div class="mb-6 p-4 bg-emerald-500/10 border border-emerald-500/20 rounded-2xl text-center">
                <p class="text-emerald-400 text-[10px] font-black uppercase tracking-widest italic">
                    <i class="fas fa-check-circle mr-2"></i> ${msg}
                </p>
            </div>
        </c:if>
        
        <form action="/doLogin" method="POST" class="space-y-6">
            <input type="hidden" name="role" value="${param.role}">
            
            <input type="email" name="email" placeholder="Email Address" 
                class="w-full bg-white/5 border border-white/10 p-4 rounded-2xl text-white outline-none 
                focus:border-${themeColor} transition-all" required>
            
            <input type="password" name="password" placeholder="Password" 
                class="w-full bg-white/5 border border-white/10 p-4 rounded-2xl text-white outline-none 
                focus:border-${themeColor} transition-all" required>
            
            <button type="submit" class="w-full ${btnColor} py-4 rounded-2xl font-black text-xs uppercase tracking-widest text-white transition-all active:scale-95 shadow-lg shadow-${themeColor}/20 hover:opacity-90">
                Login
            </button>
        </form>

        <div class="mt-8 text-center">
            <p class="text-[10px] text-gray-500 font-bold uppercase tracking-widest">
                Don't have an account? 
                <a href="/signup-selection" class="text-${themeColor} ml-2 hover:underline">Register Here</a>
            </p>
        </div>
    </div>
</main>

    <%@ include file="footer.jsp" %>
</body>
</html>