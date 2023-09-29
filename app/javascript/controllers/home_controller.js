import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["urlInput"];

  copyLink() {
    navigator.clipboard.writeText(this.urlInputTarget.value);
  }
}
