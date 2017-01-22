var width = 1000,
    height = 1000;

/*var projection = d3.geoMercator()
  .scale(50000)
  .center([41.651880, -72.641602])
  .translate([width / 2, height / 2]);*/

var projection = d3.geoAlbers()
  .scale(25000)
  .translate([-7200, 2450]);

var path = d3.geoPath()
    .projection(projection);

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);

d3.json("data/ct.json", function(error, ct) {

  console.log(ct);

  svg.append("path")
      .attr("class", "tracts")
      .datum(topojson.feature(ct, ct.objects.cb_2015_09_tract_500k))
      .attr("d", path);
});
