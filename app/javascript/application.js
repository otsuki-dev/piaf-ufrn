// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs


setTimeout(() => {
document.querySelectorAll('.alert').forEach(alert => {
    alert.style.transition = "opacity 0.5s";
    alert.style.opacity = "0";
    setTimeout(() => alert.remove(), 500);
});
}, 3000);