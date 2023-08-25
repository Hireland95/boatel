// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.querySelector(".placeholder-text").addEventListener("click", function() {
  this.style.display = "none";
  document.getElementById("search-filters").style.display = "flex";
});
