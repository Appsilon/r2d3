library(r2d3)
library(texturer)
library(magrittr)

draw_many <- function(dataset) {
  i <- list()
  i$i1 <- d3() %>%
    select("body") %>%
    append("svg") %>%
    attr("width", 500) %>%
    attr("height", 500) %>%
    save_var("svg")
  i$i2 <- textures() %>%
    lines() %>%
    thicker() %>%
    save_var("dashed")
  i$i2 <- textures() %>%
    circles() %>%
    size(5) %>%
    radius(2) %>%
    save_var("dots")

  i$i3 <- get_var("svg") %>%
    call(get_var("dots"))
  i$i4 <- get_var("svg") %>%
    selectAll("circle") %>%
    data(dataset) %>%
    enter() %>%
    append("circle") %>%
    attr("cx", "function(d) {return d.hp}") %>%
    attr("cy", "function(d) {return d.disp}") %>%
    attr("r", "function(d) {return d.mpg}") %>%
    style("fill", url(get_var("dots")))
  execute(i)
}
draw_many(mtcars)

multiple_circles <- function(dataset) {
  d3() %>%
    select("body") %>%
    append("svg") %>%
    attr("width", 500) %>%
    attr("height", 50) %>%
    selectAll("circle") %>%
    data(dataset) %>%
    enter() %>%
    append("circle") %>%
    attr("cx", "function(d, i) { return (i*50) + 25; }") %>%
    attr("cy", 25) %>%
    attr("r", "function(d) { return d; }") %>%
    attr("fill", "yellow") %>%
    attr("stroke", "orange") %>%
    attr("stroke-width", "function(d) { return d/2; }")
}
multiple_circles(seq(5,25,5))

inst <- list()
inst$i1 <- multiple_circles(seq(5, 25, 5)) %>% save_var("plot")
execute(inst)

# w <- 500
# h <- 100
# dataset <- c(5, 10, 13, 19, 21, 25, 22, 18, 15, 13, 11, 12, 15, 20, 18, 17, 16, 18, 23, 25)
# d3() %>%
#   select("body") %>%
#   append("svg") %>%
#   attr("width", w) %>%
#   attr("height", h) %>%
#   selectAll("rect") %>%
#   data(dataset) %>%
#   enter() %>%
#   append("rect") %>%
#   attr("x", "function(d, i) { return i * 21; }") %>%
#   attr("y", "function(d) { return d3.select('svg').attr('height') - d * 4; }") %>%
#   attr("width", 20) %>%
#   attr("height", "function(d) { return d * 4; }") %>%
#   attr("fill", "teal") %>%
#   render
#
# d3() %>%
#   select("body") %>%
#   append("p") %>%
#   text("New paragraph!") %>%
#   render()
#
# d3_bar_chart <- function(dataset) {
#   d3() %>%
#     select("body") %>%
#     selectAll("p") %>%
#     data(dataset) %>%
#     enter() %>%
#     append("div") %>%
#     attr("class", "bar") %>%
#     style("height", "function(d) { return d * 5 + 'px'; }") %>%
#     style("height", "function(d) { return d * 5 + 'px'; }") %>%
#     render()
# }
# d3_bar_chart(c(25, 7, 5, 26, 11))
# d3_bar_chart(c(5, 10, 15, 20, 25))
# d3_bar_chart(c(25, 7, 5, 26, 11, 8, 25, 14, 23, 19, 14, 11, 22, 29, 11, 13, 12, 17, 18, 10, 24, 18, 25, 9, 3))
# sample(30, 25, replace = T) %>% d3_bar_chart()
#
