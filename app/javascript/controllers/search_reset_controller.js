import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetForm(event) {
    const searchInput = event.currentTarget.querySelector("input[name='query']");
    if (searchInput && searchInput.value === "") {

    }
  }
}
