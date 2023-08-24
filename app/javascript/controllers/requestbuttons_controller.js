import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="requestbuttons"
export default class extends Controller {
static targets = ["acceptButton", "rejectButton", "requestText"]
  // connect() {
  //   console.log("hello world")
  // }

  disable(event){
    event.preventDefault()
    if (event.target === this.acceptButtonTarget) {
        this.requestTextTarget.innerHTML = "Request: accepted";
      } else (event.target === this.rejectButtonTarget) {
      this.requestTextTarget.innerHTML = "Request: rejected";
    }
    this.acceptButtonTarget.classList.add("d-none");
    this.rejectButtonTarget.classList.add("d-none");
    event.preventDefault()
  }
}
