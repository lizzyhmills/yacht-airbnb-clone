import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="requestbuttons"
export default class extends Controller {
static targets = ["acceptButton", "rejectButton", "requestText"]
  // connect() {
  //   console.log("hello world")
  // }

  disable(event){
    event.preventDefault()
    this.acceptButtonTarget.classList.add("d-none");
    this.rejectButtonTarget.classList.add("d-none");
  }


}
