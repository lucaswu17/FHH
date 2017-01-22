// Map variables

var width = 1000,
    height = 600;

var projection = d3.geoAlbers()
  .scale(25000)
  .translate([-7200, 2450]);

var parseDate = d3.timeParse("%m/%d/%Y");

var path = d3.geoPath()
    .projection(projection);

var drugColours = d3.scaleOrdinal()
  .domain(["Heroin", "Cocaine", "Fentanyl"])
  .range(d3.schemeDark2);

var showF = 1;
var showH = 0;
var showC = 0;

// d3.select("#fentanylCheck")
//   .on("click", function(d) {
//     flipVar(showF);
//   });

// d3.select("#heroinCheck")
//   .on("click", function(d) {
//     flipVar(showH);
//   });

// d3.select("#cocaineCheck")
//   .on("click", function(d) {
//     flipVar(showC);
//   });

// function flipVar(someVar) {
//   someVar = (someVar == 0) ? 1 : 0;
//   d3.selectAll(".ctMap").remove();
//   d3.selectAll(".ctPlot").remove();
//   createMap();
// }

d3.select("#replay")
  .on("click", function(d) {
    d3.selectAll(".ctMap").remove();
    d3.selectAll(".ctPlot").remove();
    createMap();
  });

// Plot variables

var margin = {top: 20, right: 30, bottom: 50, left: 40},
    plotWidth = 960 - margin.left - margin.right,
    plotHeight = 200 - margin.top - margin.bottom;

var x = d3.scaleBand()
    .range([0, plotWidth])
    .padding(0.1);

var y = d3.scaleLinear()
    .range([plotHeight, 0]);

createMap();

function createMap() {

  var svg = d3.select("#map").append("svg")
      .attr("class", "ctMap")
      .attr("width", width)
      .attr("height", height);

  var plot = d3.select("#plot").append("svg")
      .attr("class", "ctPlot")
      .attr("width", plotWidth + margin.left + margin.right)
      .attr("height", plotHeight + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  d3.queue()
    .defer(d3.json, "data/ct.json")
    .defer(d3.csv, "data/drug_death_1216_new.csv")
    .await(function ready(error, ct, data) {
      //console.log(ct);
      //console.log(data);

      var byMonth = d3.nest()
        .key(function(d) { return d.Date.substr(6, 4) + "" + d.Date.substring(0, 2); })
        .key(function(d) { return (d.Latitude + "" + d.Longitude); })
        .entries(data);

      svg.append("path")
          .attr("class", "tracts")
          .datum(topojson.feature(ct, ct.objects.cb_2015_09_tract_500k))
          .attr("d", path);

      byMonth.sort(function(a, b) {
        return +(a.key) - (+b.key);
      });

      console.log(byMonth);

      byMonth.forEach(function(m, i) {
        //console.log(m);
        var circles = svg.selectAll("circle" + i)
          .data(m.values)
          .enter()
          /*.filter(function(d) {
            return (d.Heroin  === "Y" || d.Cocaine === "Y" || d.Fentanyl === "Y");
          })*/
          .append("circle")
          .attr("class", "dataCircle")
          .attr("cx", function(d) {
            var latLon = d.key.split("-");
            return projection(["-" + latLon[1], latLon[0]])[0];
          })
          .attr("cy", function(d) {
            var latLon = d.key.split("-");
            return projection(["-" + latLon[1], latLon[0]])[1];
          })
          .attr("r", 0)
          // .style("fill", "black");
          .style("fill", function(d) {
            if (d.Heroin === "Y") {
              return "blue";
            } else if (d.Cocaine === "Y") {
              return "green";
            } else if (d.Fentanyl === "Y") {
              return "red";
            }
          });

        circles.transition()
          .ease(d3.easeLinear)
          .delay(function(d, j) {
            return i * 1000;
          })
          .duration(1000)
          .attr("r", function(d) {
            var count = 0;
            d.values.forEach(function(v) {
              if (showF && v.Fentanyl === "Y") {
                count = count + 1;
              }
              if (showH && v.Heroin === "Y") {
                count = count + 1;
              }
              if (showC && v.Cocaine === "Y") {
                count = count + 1;
              }
            })
            return Math.sqrt(count * 40);
          })
          .style("fill", "red")
          .transition()
          .delay(500)
          .attr("r", 0)
          .duration(200)
          .remove();

        /*circles.exit().transition()
          .attr("r", 0)
          .duration(1000)
          .remove();*/
      });

      x.domain(byMonth.map(function(d) { return d.key; }));
      y.domain([0, d3.max(byMonth, function(d) { return d.values.length; })]);

      var bars = plot.selectAll(".bar")
            .data(byMonth)
          .enter().append("rect")
            .attr("class", "bar")
            .attr("x", function(d) { return x(d.key); })
            .attr("y", function(d) { return y(d.values.length); })
            .attr("height", function(d) { return plotHeight - y(d.values.length); })
            .attr("width", x.bandwidth())
            .attr("fill", "#ccc");

      bars.transition()
        .ease(d3.easeLinear)
          .delay(function(d, i) {
            return i * 1000;
          })
          .duration(1000)
          .attr("fill", "#ff0000")
          .transition()
          .delay(500)
          .attr("fill", "#000");


      // add the x Axis
      plot.append("g")
          .attr("transform", "translate(0," + plotHeight + ")")
          .call(d3.axisBottom(x))
          .selectAll("text")
            .attr("dx", "-30px")
            .attr("dy", "-5px")
            .attr("transform", "rotate(-90)");

      // add the y Axis
      plot.append("g")
          .call(d3.axisLeft(y));
  });
}




