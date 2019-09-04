import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

const total_submitted = document.querySelector('.total_submitted').innerHTML;
const total_paid = document.querySelector('.total_paid').innerHTML;
const total_delayed = document.querySelector('.total_delayed').innerHTML;

const canvas = document.getElementById("myChart");
const ctx = canvas.getContext('2d');
const myChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Factures en attente", "Factures payées", "Factures en retard"],
    datasets: [{
      backgroundColor: [
        "#221ECE",
        "#64D286",
        "#BE0C62"
      ],
      data: [total_submitted, total_paid, total_delayed]
    }]
  }
});
