var width = 1000,
    height = 1000;

/*var projection = d3.geoMercator()
  .scale(50000)
  .center([41.651880, -72.641602])
  .translate([width / 2, height / 2]);*/

var projection = d3.geoAlbers()
  .scale(25000)
  .translate([-7200, 2450]);

var parseDate = d3.timeParse("%m/%d/%Y");

var path = d3.geoPath()
    .projection(projection);

var svg = d3.select("#map").append("svg")
    .attr("width", width)
    .attr("height", height);

var drugColours = d3.scaleOrdinal()
  .domain(["Heroin", "Cocaine", "Fentanyl"])
  .range(d3.schemeDark2);

d3.queue()
  .defer(d3.json, "data/ct.json")
  .defer(d3.csv, "data/drug_death_1216_new.csv")
  .await(function ready(error, ct, data) {
    console.log(ct);
    console.log(data);

    data.forEach(function(d) {
      d.Date = parseDate(d.Date);
    });

    var byMonth = {};
    data.forEach(function(d) {
      var yyyymm = d.Date.getFullYear() + "" +  ((d.Date.getMonth() < 9) ? "0" : "") + (d.Date.getMonth() + 1);
      if (!byMonth[yyyymm]) {
        byMonth[yyyymm] = [];
        newDate(byMonth[yyyymm], d);
      } else {
        var foundPos = 0;
        byMonth[yyyymm].forEach(function(m) {
          if (m.lon === d.Longitude && m.lat === d.Latitude) {
            m.values.push(d);
            foundPos = 1;
          }
        });
        if (!foundPos) {
          newDate(byMonth[yyyymm], d);
        }
      }
    });
    function newDate(month, d) {
        var pos = {};
        pos.lon = d.Longitude;
        pos.lat = d.Latitude;
        pos.date = parseDate((d.Date.getMonth() + 1) + "/01/" + d.Date.getFullYear());
        pos.values = [];
        pos.values.push(d);
        month.push(pos);
    }

    console.log(byMonth);

    svg.append("path")
        .attr("class", "tracts")
        .datum(topojson.feature(ct, ct.objects.cb_2015_09_tract_500k))
        .attr("d", path);

    dateSort = Object.keys(byMonth).sort();

    dateSort.forEach(function(m, i) {
      var circles = svg.selectAll("circle" + m)
        .data(byMonth[m])
        .enter()
        /*.filter(function(d) {
          return (d.Heroin  === "Y" || d.Cocaine === "Y" || d.Fentanyl === "Y");
        })*/
        .append("circle")
        .attr("class", "dataCircle")
        .attr("cx", function(d) {
          return projection([d.lon, d.lat])[0];
        })
        .attr("cy", function(d) {
          return projection([d.lon, d.lat])[1];
        })
        .attr("r", 0)
        .style("fill", "black");
        /*.style("fill", function(d) {
          if (d.Heroin === "Y") {
            return "blue";
          } else if (d.Cocaine === "Y") {
            return "green";
          } else if (d.Fentanyl === "Y") {
            return "red";
          }
        });*/

      circles.transition()
        .delay(function(d, j) {
          return i * 1000;
        })
        .duration(2000)
        .attr("r", function(d) {
          var count = 0;
          d.values.forEach(function(v) {
            if (v.Fentanyl === "Y") {
              count = count + 1;
            }
          })
          return count * 5;
        })
        .style("fill", "red")
        .remove();

      /*circles.exit().transition()
        .attr("r", 0)
        .duration(1000)
        .remove();*/
    });

});




