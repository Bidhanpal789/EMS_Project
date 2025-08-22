// Default.js
document.addEventListener('DOMContentLoaded', function () {
    // Smooth scroll functionality
    function initSmoothScroll() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const targetId = this.getAttribute('href');
                if (targetId === '#') return;

                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 70,
                        behavior: 'smooth'
                    });
                }
            });
        });
    }

    // Navbar scroll effect
    function initNavbarScroll() {
        const navbar = document.querySelector('.navbar');
        window.addEventListener('scroll', function () {
            if (window.scrollY < 60) {
                navbar.classList.add('bg-transparent');
                navbar.classList.remove('bg-white', 'shadow', 'rounded-4', 'mt-1');


            } else {
                navbar.classList.add('bg-white', 'shadow', 'rounded-4', 'mt-1');
                navbar.classList.remove('bg-transparent');
            }
        });
    }

    // Initialize ScrollSpy
    function initScrollSpy() {
        new bootstrap.ScrollSpy(document.body, {
            target: '#navbarSupportedContent',
            offset: 70
        });
    }
    function initNavbarCollapse() {
        const navbarToggler = document.querySelector('.navbar-toggler');
        const navbarCollapse = document.querySelector('.navbar-collapse');
        navbarToggler.addEventListener('click', function () {
            if (navbarCollapse.classList.contains('show')) {
                navbarCollapse.classList.remove('show');
                navbarCollapse.classList.remove('bg-light');
                navbarCollapse.classList.remove('p-2');
                navbarCollapse.classList.remove('rounded-4');
            } else {
                navbarCollapse.classList.add('show');
                navbarCollapse.classList.add('bg-light');
                navbarCollapse.classList.add('p-2');
                navbarCollapse.classList.add('rounded-4');
            }
        });
        // Close the navbar when clicking outside of it
        document.addEventListener('click', function (event) {
            if (!navbarCollapse.contains(event.target) && !navbarToggler.contains(event.target)) {
                navbarCollapse.classList.remove('show');
            }
        });
    }



    // Initialize all components
    initSmoothScroll();
    initNavbarScroll();
    initScrollSpy();
    initNavbarCollapse();
});




