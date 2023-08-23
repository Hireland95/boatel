import { Controller } from "@hotwired/stimulus"

import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = {
    disabled: Array
  }
  connect() {
    flatpickr(this.element, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      disable: this.disabledValue
  }
  )
  }
}
