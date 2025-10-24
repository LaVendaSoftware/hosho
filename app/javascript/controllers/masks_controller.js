import { Controller } from "@hotwired/stimulus";
import Inputmask from "inputmask";

const ALLOWED_MASKS = [
  ["cpf", "999.999.999-99"],
  ["cnpj", "99.999.999/9999-99"],
  ["phone", "(99)9999-9999"],
  ["cellphone", "(99)99999-9999"],
  ["zipCode", "99999-999"],
];

const ALIASES_MASKS = [
  /*radixPoint: ","*/
  ["currency", {}],
  ["percentage", { suffix: "" }],
];

// Connects to data-controller="masks"
export default class MasksController extends Controller {
  connect() {
    for (const [type, mask] of ALLOWED_MASKS) {
      const elements = document.querySelectorAll(`[data-mask="${type}"]`);
      Inputmask({ mask }).mask(elements);
    }

    for (const [alias, options] of ALIASES_MASKS) {
      const elements = document.querySelectorAll(`[data-mask="${alias}"]`);
      Inputmask({ alias, ...options }).mask(elements);
    }
  }
}
