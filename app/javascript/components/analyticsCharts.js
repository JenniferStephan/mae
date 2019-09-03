import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

const canvas = document.querySelector(".chart-canvas");
const ctx = canvas.getContext("2d");

const months = JSON.parse(canvas.dataset.months);
const values = JSON.parse(canvas.dataset.values);

var gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
gradient.addColorStop(0, '#6C16C7');
gradient.addColorStop(0.4, '#221ECE');
gradient.addColorStop(1, '#f31069');
// gradient.addColorStop(0, '#007065');
// gradient.addColorStop(1, '#64D286');

const turnoverChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: months,
    datasets: [{
      label: '€',
      data: values,
      backgroundColor: gradient,
      hoverBackgroundColor: gradient,
      datalabels: {
            align: 'end',
            anchor: 'end',
            formatter: function(value) {
            return value + ' €';
            }
      }
    }]
  },
  options: {
    title: {
      display: true,
      text: 'CA/mois'
    },
    scales: {
      xAxes: [{
        barPercentage: 0.5,
        barThickness: 27,
        minBarLength: 2,
        gridLines: {
          display: false,
          drawBorder: false
        }
      }],
      yAxes: [{
        ticks: {
          display: false,
          beginAtZero: true,
          max: 4000
        },
        gridLines: {
          display: false,
          drawBorder: false
        }
      }]
    },
    tooltips: {
      enabled: false
    },
    legend: {
      display: false
    }
  }
});
