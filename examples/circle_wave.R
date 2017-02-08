library(r2d3)
library(magrittr)

i <- list()

i$i1 <- d3() %>%
  select('.r2d3') %>%
  append('g') %>%
  attr('transform', "translate(480,250)") %>%
  attr("fill", "none") %>%
  attr("stroke-960", 10) %>%
  attr("stroke-linejoin", "round") %>%
  selectAll("path") %>%
  data(c("cyan", "magenta", "yellow")) %>%
  enter() %>%
  append("path") %>%
  attr("stroke", js_func(get_var('.'))) %>%
  style("mix-blend-mode", "darken") %>%
  datum(js_func(
    evaluate('env[".y"]') %>% save_var("i"),
    d3() %>%
      radialLine() %>%
      curve(d3() %>% js_prop('curveLinearClosed')) %>%
      angle(js_func(get_var('.'))) %>%
      radius(js_func(evaluate('200 + Math.cos(env[".x"] * 8 - env.i * 2 * Math.PI / 3 + d3.now() / 1000) * Math.pow((1 + Math.cos(env[".x"] - d3.now() / 1000)) / 2, 3) * 32')))
  )) %>%
  save_var("path")

i$i2 <- evaluate('d3.timer(function() { env.path.attr("d", function(d) { return d(d3.range(0, 2 * Math.PI, Math.PI / 200)); }); });')

execute(i)

j <- list()
j$i1 <- evaluate('
var svg = d3.select(".r2d3"),
                 width = +svg.attr("width"),
                 height = +svg.attr("height"),
                 angles = d3.range(0, 2 * Math.PI, Math.PI / 200);

                 var path = svg.append("g")
                 .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
                 .attr("fill", "none")
                 .attr("stroke-width", 10)
                 .attr("stroke-linejoin", "round")
                 .selectAll("path")
                 .data(["cyan", "magenta", "yellow"])
                 .enter().append("path")
                 .attr("stroke", function(d) { return d; })
                 .style("mix-blend-mode", "darken")
                 .datum(function(d, i) {
                 return d3.radialLine()
                 .curve(d3.curveLinearClosed)
                 .angle(function(a) { return a; })
                 .radius(function(a) {
                 var t = d3.now() / 1000;
                 return 200 + Math.cos(a * 8 - i * 2 * Math.PI / 3 + t) * Math.pow((1 + Math.cos(a - t)) / 2, 3) * 32;
                 });
                 });

                 d3.timer(function() {
                 path.attr("d", function(d) {
                 return d(angles);
                 });
                 });')
execute(j)

#
# d3.timer(function() {
#   path.attr("d", function(d) {
#     return d(d3.range(0, 2 * Math.PI, Math.PI / 200));
#   });
# });
