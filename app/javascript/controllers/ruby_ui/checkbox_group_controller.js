import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"];

  connect() {
    this.#handleRequired();
  }

  onChange() {
    this.#handleRequired();
  }

  #handleRequired() {
    if (!this.element.hasAttribute("data-required")) return;

    const checked = this.checkboxTargets.some(({ checked }) => checked);

    // biome-ignore lint/suspicious/noAssignInExpressions: auto generated code
    // biome-ignore lint/suspicious/useIterableCallbackReturn: auto generated code
    this.checkboxTargets.forEach((checkbox) => (checkbox.required = !checked));
  }
}
