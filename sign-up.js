document.addEventListener("DOMContentLoaded", function () {
  const signupForm = document.getElementById("signup-form");
  const passwordInput = document.getElementById("password");
  const confirmPasswordInput = document.getElementById("confirmPassword");
  const emailInput = document.getElementById("emailId");
  const regnoInput = document.getElementById("regNo");
  const linkedinInput = document.getElementById("linkedIn");

  signupForm.addEventListener("submit", function (event) {
    if (passwordInput.value !== confirmPasswordInput.value) {
      event.preventDefault();
      alert("Passwords didn't match. Please make sure they match.");
    }

    const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,})/;
    if (!passwordPattern.test(passwordInput.value)) {
      event.preventDefault();
      alert(
        "Password must contain at least 8 characters, one lowercase letter, one uppercase letter, one digit, and one special symbol."
      );
    }

    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!emailPattern.test(emailInput.value)) {
      event.preventDefault();
      alert("Invalid email format. Please enter a valid email.");
    }

    const linkedinPattern = /^[a-zA-Z0-9]{5,30}$/;
    if (!linkedinPattern.test(linkedinInput.value)) {
      event.preventDefault();
      alert("Invalid LinkedIn ID. Please enter a valid one.");
    }

    const regnoPattern = /^\d{3}[A-Za-z]{2}\d{5}$/;
    if (!regnoPattern.test(regnoInput.value)) {
      event.preventDefault();
      alert("Enter a valid registration number.");
    }
  });
});
