import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calculate-employee-discount"
export default class extends Controller {
  static targets = ["salary", "salaryDiscount", "salaryDiscountHidden"];

  calculate() {
    const salary = this.salaryTarget.value;
    const controller = this;

    fetch("/api/v1/employees/calculate_discount", {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ salary: salary }),
    })
      .then(response => response.json())
      .then(data => {
        controller.salaryDiscountTarget.value = data.salary_discount;
        controller.salaryDiscountHiddenTarget.value = data.salary_discount;
      })
      .catch(error => {
        controller.salaryDiscountTarget.value = 0;
        controller.salaryDiscountHiddenTarget.value = 0;
      });
  }
}
