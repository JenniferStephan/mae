const width = 300;
const height = 240;
const margin = 50;

const radius = Math.min(width, height) / 2 - margin;

const svg = d3.select("#my_dataviz")
  .append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

const total_submitted = document.querySelector('.total_submitted').innerHTML;
const total_paid = document.querySelector('.total_paid').innerHTML;
const total_delayed = document.querySelector('.total_delayed').innerHTML;

const data = {a: total_submitted, b: total_paid, c: total_delayed};


const color = d3.scaleOrdinal()
  .domain(data)
  .range(["#221ECE", "#64D286", "#BE0C62"])


// Compute the position of each group on the pie:
const pie = d3.pie()
  .value(function(d) {return d.value; })

const data_ready = pie(d3.entries(data))

// Build the pie chart: Basically, each part of the pie is a path that we build using the arc function.
svg
  .selectAll('whatever')
  .data(data_ready)
  .enter()
  .append('path')
  .attr('d', d3.arc()
    .innerRadius(100)         // This is the size of the donut hole
    .outerRadius(radius)
  )
  .attr('fill', function(d){ return(color(d.data.key)) })
  .attr("stroke", "black")
  .style("stroke-width", "2px")
  .style("opacity", 0.8)

const div = d3.select("body").append("div")
    .attr("class", "tooltip")
    .style("opacity", 0);
