import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["placeholder", "form"]
  connect() {
    console.log("hello from the search bar controller")
    console.log(this.placeholderTarget)
    console.log(this.formTarget)
  }

  appear() {
    this.placeholderTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
