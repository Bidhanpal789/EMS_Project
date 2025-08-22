function togglePasswordVisibility(icon) {
    // Get the parent input group container
    const container = icon.closest('.input-group');

    // Find the password input within this container
    const passwordInput = container.querySelector('input');

    // Toggle the password visibility
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.querySelector('i').classList.replace('fa-eye', 'fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        icon.querySelector('i').classList.replace('fa-eye-slash', 'fa-eye');
    }
}