import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["add_perk", "template"]

  add_association(event) {
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().valueOf())
    this.add_perkTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove_association(event) {
    event.preventDefault()
    let perk = event.target.closest(".nested-fields")
    perk.querySelector("input[name*='_destroy']").value = 1
    perk.style.display = 'none'
  }
}
