import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"  // Импортируем UJS

const application = Application.start()

// Настройка UJS
Rails.start()  // Запускаем UJS

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }
