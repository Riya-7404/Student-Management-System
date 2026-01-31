<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="bg-[#010409] text-white pt-20 pb-10 border-t border-white/5 font-sans mt-auto">
    <div class="container mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-12">
        
        <div class="space-y-6 col-span-1 md:col-span-1">
            <div class="flex items-center gap-3">
                <div class="bg-emerald-500/20 p-2 rounded-xl border border-emerald-500/30 shadow-[0_0_15px_rgba(16,185,129,0.1)]">
                    <i class="fas fa-network-wired text-emerald-400 text-xl"></i>
                </div>
                <h3 class="text-xl font-black tracking-tighter uppercase leading-none italic">
                    MENTOR <br><span class="text-emerald-400 text-sm">MESH ECOSYSTEM</span>
                </h3>
            </div>
            <p class="text-gray-500 text-xs leading-relaxed font-bold uppercase tracking-wider">
                We are reshaping the digital campus. Our goal is to eliminate administrative friction and empower education through cloud technology.
            </p>
            <div class="flex gap-4">
                <div class="w-8 h-8 rounded-lg bg-white/5 flex items-center justify-center hover:bg-emerald-500/20 hover:text-emerald-400 transition-all cursor-default"><i class="fab fa-github text-sm"></i></div>
                <div class="w-8 h-8 rounded-lg bg-white/5 flex items-center justify-center hover:bg-emerald-500/20 hover:text-emerald-400 transition-all cursor-default"><i class="fas fa-code text-sm"></i></div>
            </div>
        </div>

        <div>
            <h4 class="text-emerald-400 font-black uppercase text-[10px] mb-6 tracking-[0.2em]">System Nodes</h4>
            <ul class="space-y-3 text-gray-500 text-xs font-bold uppercase tracking-widest">
                <li class="group flex items-center gap-2 hover:text-white transition-all cursor-default">
                    <span class="w-1 h-1 bg-gray-700 group-hover:bg-emerald-500 rounded-full transition-all"></span> Dashboard
                </li>
                <li class="group flex items-center gap-2 hover:text-white transition-all cursor-default">
                    <span class="w-1 h-1 bg-gray-700 group-hover:bg-emerald-500 rounded-full transition-all"></span> Attendance Logs
                </li>
                <li class="group flex items-center gap-2 hover:text-white transition-all cursor-default">
                    <span class="w-1 h-1 bg-gray-700 group-hover:bg-emerald-500 rounded-full transition-all"></span> Submissions
                </li>
            </ul>
        </div>

        <div>
            <h4 class="text-emerald-400 font-black uppercase text-[10px] mb-6 tracking-[0.2em]">Technology</h4>
            <ul class="space-y-3 text-gray-500 text-[10px] font-bold uppercase tracking-widest">
                <li class="flex items-center gap-2 text-gray-400"><i class="fas fa-server text-[10px]"></i> Spring Boot 3.x</li>
                <li class="flex items-center gap-2 text-gray-400"><i class="fas fa-database text-[10px]"></i> MySQL Localhost</li>
                <li class="flex items-center gap-2 text-gray-400"><i class="fas fa-layer-group text-[10px]"></i> JPA / Hibernate</li>
                <li class="flex items-center gap-2 text-gray-400"><i class="fas fa-file-code text-[10px]"></i> JSP / JSTL</li>
            </ul>
        </div>

        <div>
            <h4 class="text-emerald-400 font-black uppercase text-[10px] mb-6 tracking-[0.2em]">Support Node</h4>
            <ul class="space-y-4 text-gray-500 text-xs font-medium">
                <li class="flex items-start gap-3 cursor-default">
                    <i class="fas fa-terminal text-emerald-400 mt-1"></i>
                    <span>Admin Dashboard Access <br><span class="text-[9px] text-gray-600 font-black uppercase tracking-widest">Secure Node Enabled</span></span>
                </li>
                <li class="flex items-center gap-3 cursor-default group">
                    <i class="fas fa-envelope text-emerald-400"></i>
                    <span class="group-hover:text-white transition-all italic">admin@mentormesh.local</span>
                </li>
                <li class="pt-4 border-t border-white/5 mt-4">
                    <p class="text-[10px] uppercase font-black tracking-widest text-gray-600">Database Status</p>
                    <p class="text-emerald-400/80 font-bold flex items-center gap-2">
                        <span class="w-1.5 h-1.5 bg-emerald-500 rounded-full animate-pulse shadow-[0_0_10px_#10b981]"></span>
                        Connected: 3306
                    </p>
                </li>
            </ul>
        </div>

    </div>

    <div class="border-t border-white/5 mt-16 pt-8 text-center px-6">
        <p class="text-gray-600 text-[9px] font-black uppercase tracking-[0.4em]">
            &copy; 2026 MENTOR MESH | Reshaping The Digital Campus
        </p>
    </div>
</footer>