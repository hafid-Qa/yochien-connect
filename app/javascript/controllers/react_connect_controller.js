import { Controller } from "@hotwired/stimulus";
import { initReact } from "../front_end/index.jsx";
// Connects to data-controller="react-connect"
export default class extends Controller {
  connect() {
    console.log("from connect react Controller");
    initReact();
  }
}
