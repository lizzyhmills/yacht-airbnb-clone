import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editbooking"
export default class extends Controller {
  static targets = ['editform']
  connect() {
    console.log("hello from editbooking controller")
  }

  edit(event) {
    // event.preventDefault()
    console.log('hello from edit function')
    this.editformTarget.classList.toggle("d-none");
  }
}
