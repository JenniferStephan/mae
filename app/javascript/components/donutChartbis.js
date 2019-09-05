import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

if (document.querySelector('#myChart')) {
  const canvas = document.getElementById("myChart");

  const totalDelayed = JSON.parse(canvas.dataset.delayed);
  const totalPaid = JSON.parse(canvas.dataset.paid);
  const totalSubmitted = JSON.parse(canvas.dataset.submitted);
  console.log(canvas);

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
        data: [totalSubmitted, totalPaid, totalDelayed]
      }]
    }
  });
}
