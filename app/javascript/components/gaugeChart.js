// import Chart from 'chart.js';
// import ChartDataLabels from 'chartjs-plugin-datalabels';
// import * as RadialGauge from 'chartjs-chart-radial-gauge';


// var randomScalingFactor = function() {
//  return Math.round(Math.random() * 100);
// };

// Chart.defaults.global.defaultFontFamily = "Verdana";

// const canvas = document.getElementById('chart-area');
// console.log(canvas);
// const ctx = canvas.getContext('2d');

// var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
// gradientStroke.addColorStop(0, "#80b6f4");
// gradientStroke.addColorStop(1, "#f49080");

// var config = {
//  type: "radialGauge",
//  data: {
//   labels: ["Metrics"],
//   datasets: [
//    {
//     data: [randomScalingFactor()],
//     backgroundColor: [gradientStroke],
//     borderWidth: 0,
//     label: "Score"
//    }
//   ]
//  },
//  options: {
//   responsive: true,
//   legend: {},
//   title: {
//    display: true,
//    text: "Radial gauge chart"
//   },
//   centerPercentage: 80
//  }
// };

// window.onload = function() {
//  var ctx = document.getElementById("chart-area").getContext("2d");
//  window.myRadialGauge = new Chart(ctx, config);
// };

// document.getElementById("randomizeData").addEventListener("click", function() {
//  config.data.datasets.forEach(function(dataset) {
//   dataset.data = dataset.data.map(function() {
//    return randomScalingFactor();
//   });
//  });

//  window.myRadialGauge.update();
// });



