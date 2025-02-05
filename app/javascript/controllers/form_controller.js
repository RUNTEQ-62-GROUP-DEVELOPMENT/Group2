import { Controller } from "@hotwired/stimulus"
import "./application"

export default class extends Controller {
  connect() {
    this.timeout = null;
    this.formElement = this.element.closest('form');
  }

  submit() {
    clearTimeout(this.timeout);

    if (this.formElement instanceof HTMLFormElement && this.formElement.isConnected) {
      this.timeout = setTimeout(() => {
        this.formElement.requestSubmit();
      }, 200);
    }
  }
}
