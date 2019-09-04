import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';


if (document.querySelector('#doughnut-chart')) {

const total_submitted = document.querySelector('.total_submitted').innerHTML;
const total_paid = document.querySelector('.total_paid').innerHTML;
const total_delayed = document.querySelector('.total_delayed').innerHTML;

new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["Factures en attente", "Factures payées", "Factures en retard"],
      datasets: [
        {
          label: "Factures (en euros)",
          backgroundColor: ["#221ECE", "#64D286","#BE0C62"],
          data: [total_submitted, total_paid, total_delayed]
        }
      ]
    },
    options: {
      title: {
        display: false,
        text: 'Mes factures'
      },
      legend: {
            display: true,
            position: 'right',
        }
    }
});
}
