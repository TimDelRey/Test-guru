// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"  // Импорт Turbo
import Rails from "@rails/ujs"    // Импорт UJS
import "controllers"              // Импорт Stimulus контроллеров

// Запуск UJS
Rails.start()

// Добавляем обработчик события загрузки Turbo
document.addEventListener("turbo:load", () => {
    console.log("Turbo is working!");
});
