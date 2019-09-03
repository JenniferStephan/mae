import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

const canvas = document.querySelector(".chart-canvas");
const ctx = canvas.getContext("2d");

const months = JSON.parse(canvas.dataset.months);
const values = JSON.parse(canvas.dataset.values);

var gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
gradient.addColorStop(0, '#f5365c');
gradient.addColorStop(0.7, '#f56036');
gradient.addColorStop(1, '#FAA306');

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
        barThickness: 25,
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
