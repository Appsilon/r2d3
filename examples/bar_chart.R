library(r2d3)
library(magrittr)

d3_bar_chart <- function(v) {
  dataset <- data.frame(
    v = v,
    height = v * 5,
    x = 30 * 1:length(v),
    y = 150 - v*5
  )
  i <- list()
  i$i1 <- d3() %>%
    select(".r2d3") %>%
    append("svg") %>%
    attr("width", 500) %>%
    attr("height", 500) %>%
    save_var("svg")
  i$i4 <- get_var("svg") %>%
    selectAll("rect") %>%
    data(dataset) %>%
    enter() %>%
    append("rect") %>%
    attr("width", 25) %>%
    attr("height", r2js::compile(function(i) i$height)) %>%
    attr("x", r2js::compile(function(i) i$x)) %>%
    attr("y", r2js::compile(function(i) i$y)) %>%
    style("fill", "black")
  execute(i)
}
d3_bar_chart(c(25, 7, 5, 26, 11))
d3_bar_chart(c(5, 10, 15, 20, 25))
d3_bar_chart(c(25, 7, 5, 26, 11, 8, 25, 14, 23, 19, 14, 11, 22, 29, 11, 13, 12, 17, 18, 10, 24, 18, 25, 9, 3))
sample(30, 25, replace = T) %>% d3_bar_chart()

