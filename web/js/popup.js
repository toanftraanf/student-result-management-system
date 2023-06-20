/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Show the notification and start the progress bar animation
function showNotification() {
    var notification = document.getElementById('notification');
    notification.classList.add('show');

    var progressBar = document.getElementById('progress-bar');
    var width = 1;
    var animationDuration = 3000; // Duration of the progress animation in milliseconds
    var interval = animationDuration / 100; // Interval for updating the progress in milliseconds

    var timerId = setInterval(function () {
        if (width >= 100) {
            clearInterval(timerId);
            hideNotification();
        } else {
            width++;
            progressBar.style.width = width + '%';
        }
    }, interval);
}

// Hide the notification
function hideNotification() {
    var notification = document.getElementById('notification');
    notification.classList.remove('show');
    notification.style.right = '-300px'; // Slide the notification off-screen to the right
}

// Call the showNotification function when the page loads
window.onload = function () {
    showNotification();
};

