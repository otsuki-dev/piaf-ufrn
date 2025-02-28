// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs


document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
      let flash = document.getElementById("flash-message");
      if (flash) {
        flash.style.transition = "opacity 1s";
        flash.style.opacity = "0";
        setTimeout(() => flash.remove(), 1000);
      }
    }, 3000); // Remove após 3s
  });
  