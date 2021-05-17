import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    fetchUrl: String,
    resetUrl: String,
    suggestUrl: String
  }
  static targets = [ "partNumber", "reset", "results" ]

  reset() {
    this.partNumberTarget.value = ""
    fetch(this.resetUrlValue)
      .then(response => response.text())
      .then(html => this.resetTarget.innerHTML = html)
  }

  lookup() {
    fetch(`${this.suggestUrlValue}?q=${this.partNumberTarget.value}`)
      .then(response => response.text())
      .then(html => this.resultsTarget.innerHTML = html)
  }

  select(event) {
    const partNumber = event.target.innerHTML

    this.resultsTarget.innerHTML = ""
    this.partNumberTarget.value = partNumber

    fetch(`${this.fetchUrlValue}?q=${partNumber}`)
      .then(response => response.text())
      .then(html => this.resetTarget.innerHTML = html)
  }
}
