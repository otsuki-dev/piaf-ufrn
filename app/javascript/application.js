// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs

$(document).ready(function() {
  $('[data-mask]').inputmask(); 
});

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

document.addEventListener("DOMContentLoaded", function () {
  new Swiper(".mySwiper", {
    slidesPerView: "auto",
    spaceBetween: 20,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev"
    },
    breakpoints: {
      640: { slidesPerView: 1.5 },
      768: { slidesPerView: 2.5 },
      1024: { slidesPerView: 3.5 }
    }
  });
});

document.addEventListener("DOMContentLoaded", function() {
  const radioButtons = document.querySelectorAll('input[type="radio"][value="true"]');
  const responsibilityCheckbox = document.querySelector('#enrollment_physical_activity_responsibility');

  radioButtons.forEach(radio => {
    radio.addEventListener('change', function() {
      if (this.checked) {
        alert("Você respondeu 'SIM' a uma pergunta. Recomendamos consultar um médico antes de prosseguir.");
      }
    });
  });
});  