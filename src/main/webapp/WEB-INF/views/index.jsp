<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<title>Student Management System | Home</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap')
	;

body {
	font-family: 'Plus Jakarta Sans', sans-serif;
	background-color: #010409;
	color: white;
	margin: 0;
	overflow-x: hidden;
}

/* --- Animations & Effects --- */
.bouncing-globe {
	width: 420px;
	height: 420px;
	object-fit: cover;
	border-radius: 50%;
	border: 2px solid rgba(16, 185, 129, 0.4);
	box-shadow: 0 0 60px rgba(16, 185, 129, 0.3);
	animation: realistic-bounce 2.5s ease-in-out infinite;
}

@
keyframes realistic-bounce { 0%, 100% {
	transform: translateY(0);
}

50


%
{
transform


:


translateY
(


-35px


)
;


}
}
.feature-card {
	background: rgba(255, 255, 255, 0.02);
	border: 1px solid rgba(255, 255, 255, 0.05);
	padding: 40px 30px;
	border-radius: 24px;
	transition: 0.4s;
}

.feature-card:hover {
	border-color: #10b981;
	transform: translateY(-10px);
	background: rgba(16, 185, 129, 0.05);
}

.contact-input {
	background: rgba(255, 255, 255, 0.03);
	border: 1px solid rgba(255, 255, 255, 0.1);
	color: white;
	padding: 12px 20px;
	border-radius: 12px;
	width: 100%;
	outline: none;
	transition: 0.3s;
}

.contact-input:focus {
	border-color: #10b981;
	background: rgba(16, 185, 129, 0.05);
}
</style>
</head>
<body class="flex flex-col min-h-screen">

	<jsp:include page="navbar.jsp" />

	<main class="flex-grow">
		<section class="min-h-screen flex items-center pt-20">
			<div
				class="container mx-auto px-6 grid lg:grid-cols-2 gap-12 items-center">
				<div data-aos="fade-right">
					<h1
						class="text-6xl lg:text-8xl font-black mb-8 leading-[1.05] tracking-tighter">
						MENTOR <span class="text-emerald-400">MESH</span>
					</h1>
					<p class="text-slate-400 text-xl mb-12 max-w-lg leading-relaxed">
						The ultimate student data management ecosystem for
						high-performance institutions.A unified environment designed to
						bridge the gap between mentors and students through a seamless
						digital interface, optimized for high-performance academic
						workflows.</p>
					<c:if test="${empty sessionScope.user}">
						<a href="${pageContext.request.contextPath}/signup-selection"
							class="bg-emerald-600 px-10 py-4 rounded-full font-bold text-sm tracking-widest hover:bg-emerald-500 transition shadow-2xl no-underline text-white">JOIN
							NOW</a>
					</c:if>
				</div>
				<div class="flex justify-center" data-aos="zoom-in">
					<div class="relative">
						<div
							class="absolute inset-0 bg-emerald-500/10 blur-[120px] rounded-full"></div>
						<img
							src="${pageContext.request.contextPath}/images/hero-globe.png"
							class="bouncing-globe relative z-10" alt="Hero Globe">
					</div>
				</div>
			</div>
		</section>

		<section id="features" class="py-32 bg-[#0d1117]/40">
			<div class="container mx-auto px-6 text-center">
				<h3
					class="text-3xl font-extrabold mb-20 uppercase tracking-[0.3em] text-emerald-400">Core
					Features</h3>
				<div class="grid md:grid-cols-3 gap-8">
					<div class="feature-card" data-aos="fade-up">
						<i class="fas fa-shield-halved text-emerald-400 text-3xl mb-6"></i>
						<h4 class="text-xl font-bold mb-3">Security</h4>
						<p class="text-slate-500 text-sm">Advanced encryption for
							records.</p>
					</div>
					<div class="feature-card" data-aos="fade-up" data-aos-delay="100">
						<i class="fas fa-bolt text-blue-400 text-3xl mb-6"></i>
						<h4 class="text-xl font-bold mb-3">Sync</h4>
						<p class="text-slate-500 text-sm">Real-time data across
							devices.</p>
					</div>
					<div class="feature-card" data-aos="fade-up" data-aos-delay="200">
						<i class="fas fa-chart-pie text-purple-400 text-3xl mb-6"></i>
						<h4 class="text-xl font-bold mb-3">Analytics</h4>
						<p class="text-slate-500 text-sm">Visual performance tracking.</p>
					</div>
					<div class="feature-card" data-aos="fade-up" data-aos-delay="300">
						<i class="fas fa-user-check text-orange-400 text-3xl mb-6"></i>
						<h4 class="text-xl font-bold mb-3">Attendance</h4>
						<p class="text-slate-500 text-sm">Automated tracking & alerts.</p>
					</div>
					<div class="feature-card" data-aos="fade-up" data-aos-delay="400">
						<i class="fas fa-book-open text-pink-400 text-3xl mb-6"></i>
						<h4 class="text-xl font-bold mb-3">Library</h4>
						<p class="text-slate-500 text-sm">24/7 Digital resource hub.</p>
					</div>
					<div class="feature-card" data-aos="fade-up" data-aos-delay="500">
						<i class="fas fa-users-rectangle text-cyan-400 text-3xl mb-6"></i>
						<h4 class="text-xl font-bold mb-3">Portals</h4>
						<p class="text-slate-500 text-sm">Dedicated parent-teacher
							access.</p>
					</div>
				</div>
			</div>
		</section>

		<section id="about" class="py-32">
			<div
				class="container mx-auto px-6 grid lg:grid-cols-2 gap-16 items-center">
				<img
					src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=800&q=80"
					class="rounded-3xl grayscale shadow-2xl border border-white/5"
					data-aos="fade-right">
				<div data-aos="fade-left">
					<h2
						class="text-4xl font-black mb-8 uppercase tracking-tighter italic text-emerald-400">Our
						Mission</h2>
					<p class="text-slate-400 text-lg leading-relaxed">Reshaping the
						digital campus. Our goal is to eliminate administrative friction
						and empower education through cloud technology, creating a
						high-performance ecosystem where data meets intelligence.</p>
				</div>
			</div>
		</section>

		<section id="contact" class="py-32 bg-[#0d1117]/60">
			<div class="container mx-auto px-6 max-w-4xl">
				<div class="text-center mb-16">
					<h3
						class="text-3xl font-extrabold uppercase tracking-widest text-emerald-400 mb-4">Get
						In Touch</h3>
					<p class="text-slate-500">Have questions? Send us a message and
						we'll reply within 24 hours.</p>
				</div>

				<div
					class="bg-white/5 p-8 lg:p-12 rounded-[32px] border border-white/10 shadow-2xl"
					data-aos="flip-up">
					<form action="contact-submit" method="POST"
						class="grid grid-cols-1 md:grid-cols-2 gap-6">
						<div>
							<label
								class="block text-[10px] uppercase tracking-widest font-bold text-slate-500 mb-2">Full
								Name</label> <input type="text" name="name" class="contact-input"
								placeholder="John Doe" required>
						</div>
						<div>
							<label
								class="block text-[10px] uppercase tracking-widest font-bold text-slate-500 mb-2">Email
								Address</label> <input type="email" name="email" class="contact-input"
								placeholder="john@example.com" required>
						</div>
						<div class="md:col-span-2">
							<label
								class="block text-[10px] uppercase tracking-widest font-bold text-slate-500 mb-2">Message</label>
							<textarea name="message" rows="4" class="contact-input"
								placeholder="How can we help you?" required></textarea>
						</div>
						<div class="md:col-span-2 text-center mt-4">
							<button type="submit"
								class="bg-emerald-600 hover:bg-emerald-500 text-white px-12 py-4 rounded-full font-bold text-[10px] tracking-[0.2em] transition uppercase active:scale-95 shadow-lg shadow-emerald-500/20">
								Send Message</button>
						</div>
					</form>
				</div>
			</div>
		</section>
	</main>

	<jsp:include page="footer.jsp" />

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init({
			duration : 1000,
			once : true
		});
	</script>
</body>
</html>