<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="glass-nav fixed top-0 w-full z-50 py-4 bg-[#0d1117]/90 backdrop-blur-md border-b border-white/5">
    <div class="container mx-auto px-6 flex justify-between items-center">
        
        <div class="flex items-center gap-3">
            <div class="bg-emerald-500/20 p-2 rounded-xl border border-emerald-500/30">
                <i class="fas fa-university text-emerald-400 text-xl"></i>
            </div>
            <a href="${pageContext.request.contextPath}/" class="text-xl font-black text-white tracking-tighter uppercase no-underline">
                Student <span class="text-emerald-400">Management</span>
            </a>
        </div>
        
        <div class="hidden lg:flex items-center gap-8">
            <a href="${pageContext.request.contextPath}/#" class="text-gray-400 hover:text-white font-bold text-[10px] uppercase no-underline tracking-widest transition">Home</a>
            <a href="${pageContext.request.contextPath}/#features" class="text-gray-400 hover:text-white font-bold text-[10px] uppercase no-underline tracking-widest transition">Features</a>
            <a href="${pageContext.request.contextPath}/#about" class="text-gray-400 hover:text-white font-bold text-[10px] uppercase no-underline tracking-widest transition">About Us</a>
            <a href="${pageContext.request.contextPath}/#contact" class="text-gray-400 hover:text-white font-bold text-[10px] uppercase no-underline tracking-widest transition">Contact</a>
        </div>

        <div class="flex items-center gap-6">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/dashboard" class="text-gray-400 hover:text-white font-bold text-[10px] uppercase no-underline tracking-widest transition">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout" class="text-red-500 font-bold no-underline text-[10px] uppercase tracking-widest transition hover:text-red-400">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login-selection" class="text-gray-400 hover:text-white font-bold text-[10px] uppercase no-underline tracking-widest transition">Login</a>
                    <a href="${pageContext.request.contextPath}/signup-selection" class="bg-emerald-600 text-white px-6 py-2 rounded-full text-[10px] font-bold no-underline uppercase tracking-widest hover:bg-emerald-500 transition shadow-lg shadow-emerald-500/20 active:scale-95">
                        Sign Up
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>