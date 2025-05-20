import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"

Chart.register(...registerables)

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = {
    salaryRanges: Array,
    employeeCounts: Array,
    totalEmployees: Number,
    averageSalary: Number
  }

  connect() {
    const ctx = this.element.querySelector("#salaryDistributionChart").getContext("2d");
    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: this.salaryRangesValue,
        datasets: [{
          data: this.employeeCountsValue,
          backgroundColor: [
            '#FF6384',
            '#36A2EB',
            '#FFCE56',
            '#4BC0C0',
            '#9966FF',
            '#FF9F40'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'right',
            labels: {
              font: {
                size: 12
              },
              boxWidth: 15,
              padding: 10
            }
          },
          title: {
            display: true,
            text: 'Distribuição de Funcionários por Faixa Salarial',
            font: {
              size: 14
            },
            padding: {
              bottom: 10
            }
          }
        }
      }
    });
  }
}

