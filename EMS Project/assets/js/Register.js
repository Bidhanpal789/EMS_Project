document.addEventListener('DOMContentLoaded', function () {
    // Form validation
    const registerForm = document.getElementById('registerForm');
    const passwordInput = document.getElementById('txtPassword');
    const passwordStrength = document.querySelector('.password-strength');
    const passwordHint = document.querySelector('.password-hint');

    //Password strength indicator
    passwordInput.addEventListener('input', function () {
        const password = this.value;
        let strength = 0;

        // Show hint when focused
        if (!passwordHint.style.display || passwordHint.style.display === 'none') {
            passwordHint.style.display = 'block';
        }

        // Check length
        if (password.length >= 8) strength += 1;

        // Check for numbers
        if (/\d/.test(password)) strength += 1;

        // Check for special chars
        if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength += 1;

        // Check for uppercase
        if (/[A-Z]/.test(password)) strength += 1;

        // Update strength indicator
        passwordStrength.className = 'password-strength';

        if (password.length === 0) {
            passwordHint.style.display = 'none';
        } else if (strength <= 1) {
            passwordStrength.classList.add('weak');
        } else if (strength <= 3) {
            passwordStrength.classList.add('medium');
        } else {
            passwordStrength.classList.add('strong');
        }
    });


});


