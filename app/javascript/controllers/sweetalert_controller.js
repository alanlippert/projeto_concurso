import Swal from 'sweetalert2'
window.Swal = Swal;
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  connect() {
    console.log('Conected!')
  }

  showAlert(event) {
    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire('SweetAlert2 is working!')
  }

}
