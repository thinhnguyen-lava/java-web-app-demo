// JavaScript for Java Web App Demo

document.addEventListener('DOMContentLoaded', function() {

    // Update satisfaction level display in real-time
    const satisfactionSlider = document.getElementById('satisfaction');
    const satisfactionValue = document.getElementById('satisfactionValue');

    if (satisfactionSlider && satisfactionValue) {
        satisfactionSlider.addEventListener('input', function() {
            satisfactionValue.textContent = this.value;
        });
    }

    // Form validation and submission handling
    const demoForm = document.getElementById('demoForm');

    if (demoForm) {
        demoForm.addEventListener('submit', function(e) {
            // Client-side validation
            if (!validateForm()) {
                e.preventDefault();
                return false;
            }

            // Add loading state
            const submitButton = demoForm.querySelector('button[type="submit"]');
            if (submitButton) {
                submitButton.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Submitting...';
                submitButton.disabled = true;
            }

            // Add submitting class to form
            demoForm.classList.add('form-submitting');
        });

        // Real-time email validation
        const emailInput = document.getElementById('email');
        if (emailInput) {
            emailInput.addEventListener('blur', function() {
                validateEmail(this);
            });
        }

        // Real-time password validation
        const passwordInput = document.getElementById('password');
        if (passwordInput) {
            passwordInput.addEventListener('input', function() {
                validatePassword(this);
            });
        }

        // Phone number formatting
        const phoneInput = document.getElementById('phone');
        if (phoneInput) {
            phoneInput.addEventListener('input', function(e) {
                formatPhoneNumber(e.target);
            });
        }
    }

    // Dark mode toggle functionality (demo)
    const darkModeToggle = document.getElementById('darkMode');
    if (darkModeToggle) {
        darkModeToggle.addEventListener('change', function() {
            if (this.checked) {
                showToast('Dark mode will be enabled after form submission', 'info');
            }
        });
    }

    // Newsletter toggle
    const newsletterToggle = document.getElementById('newsletter');
    if (newsletterToggle) {
        newsletterToggle.addEventListener('change', function() {
            if (this.checked) {
                showToast('You will be subscribed to our newsletter', 'success');
            }
        });
    }

    // Initialize tooltips if Bootstrap is available
    if (typeof bootstrap !== 'undefined') {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function(tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    }

    // Auto-resize textarea
    const commentsTextarea = document.getElementById('comments');
    if (commentsTextarea) {
        commentsTextarea.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
    }

    // Character counter for comments
    if (commentsTextarea) {
        const maxLength = 500;
        const counterDiv = document.createElement('div');
        counterDiv.className = 'form-text text-end';
        counterDiv.id = 'commentCounter';
        commentsTextarea.parentNode.appendChild(counterDiv);

        commentsTextarea.addEventListener('input', function() {
            const remaining = maxLength - this.value.length;
            counterDiv.textContent = `${this.value.length} / ${maxLength} characters`;

            if (remaining < 50) {
                counterDiv.classList.add('text-warning');
            } else {
                counterDiv.classList.remove('text-warning');
            }
        });
    }
});

// Form validation function
function validateForm() {
    let isValid = true;
    const requiredFields = document.querySelectorAll('[required]');

    requiredFields.forEach(field => {
        if (!field.value.trim()) {
            showError(field, 'This field is required');
            isValid = false;
        } else {
            clearError(field);
        }
    });

    return isValid;
}

// Email validation
function validateEmail(emailField) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (emailField.value && !emailRegex.test(emailField.value)) {
        showError(emailField, 'Please enter a valid email address');
        return false;
    } else {
        clearError(emailField);
        return true;
    }
}

// Password validation
function validatePassword(passwordField) {
    const password = passwordField.value;
    const feedbackDiv = passwordField.nextElementSibling;

    if (password.length > 0 && password.length < 6) {
        showError(passwordField, 'Password must be at least 6 characters');
        return false;
    } else {
        clearError(passwordField);
        return true;
    }
}

// Phone number formatting
function formatPhoneNumber(phoneField) {
    let value = phoneField.value.replace(/\D/g, '');

    if (value.length > 10) {
        value = value.slice(0, 10);
    }

    if (value.length >= 6) {
        phoneField.value = `(${value.slice(0, 3)}) ${value.slice(3, 6)}-${value.slice(6)}`;
    } else if (value.length >= 3) {
        phoneField.value = `(${value.slice(0, 3)}) ${value.slice(3)}`;
    } else {
        phoneField.value = value;
    }
}

// Show error message
function showError(field, message) {
    clearError(field);

    field.classList.add('is-invalid');

    const errorDiv = document.createElement('div');
    errorDiv.className = 'invalid-feedback';
    errorDiv.textContent = message;

    field.parentNode.appendChild(errorDiv);
}

// Clear error message
function clearError(field) {
    field.classList.remove('is-invalid');

    const errorDiv = field.parentNode.querySelector('.invalid-feedback');
    if (errorDiv) {
        errorDiv.remove();
    }
}

// Show toast notification
function showToast(message, type = 'info') {
    // Create toast container if it doesn't exist
    let toastContainer = document.getElementById('toastContainer');
    if (!toastContainer) {
        toastContainer = document.createElement('div');
        toastContainer.id = 'toastContainer';
        toastContainer.className = 'toast-container position-fixed top-0 end-0 p-3';
        toastContainer.style.zIndex = '9999';
        document.body.appendChild(toastContainer);
    }

    // Create toast element
    const toastId = 'toast-' + Date.now();
    const bgClass = type === 'success' ? 'bg-success' :
                    type === 'error' ? 'bg-danger' :
                    type === 'warning' ? 'bg-warning' : 'bg-info';

    const toastHTML = `
        <div id="${toastId}" class="toast align-items-center text-white ${bgClass} border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    `;

    toastContainer.insertAdjacentHTML('beforeend', toastHTML);

    // Show toast
    const toastElement = document.getElementById(toastId);
    if (typeof bootstrap !== 'undefined') {
        const toast = new bootstrap.Toast(toastElement, {
            autohide: true,
            delay: 3000
        });
        toast.show();

        // Remove toast element after it's hidden
        toastElement.addEventListener('hidden.bs.toast', function() {
            toastElement.remove();
        });
    }
}

// Smooth scroll to top
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// Add smooth scroll behavior to internal links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Console welcome message
console.log('%c Java Web App Demo ', 'background: #0d6efd; color: white; font-size: 16px; padding: 5px 10px; border-radius: 5px;');
console.log('Built with JSP/Servlets and Bootstrap 5');
console.log('For demo and educational purposes');
