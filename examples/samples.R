library(r2d3)
library(texturer)
library(magrittr)

draw_many <- function(dataset) {
  i <- list()
  i$i1 <- d3() %>%
    select(".r2d3") %>%
    append("svg") %>%
    attr("width", 500) %>%
    attr("height", 500) %>%
    save_var("svg")
  i$i2 <- textures() %>%
    lines() %>%
    thicker() %>%
    save_var("dashed")
  i$i3 <- textures() %>%
    circles() %>%
    size(5) %>%
    radius(2) %>%
    save_var("dots")
  i$i4 <- get_var("svg") %>%
    call(get_var("dashed"))
  i$i5 <- get_var("svg") %>%
    call(get_var("dots"))
  i$i6 <- get_var("svg") %>%
    selectAll("circle") %>%
    data(dataset) %>%
    enter() %>%
    append("circle") %>%
    attr("cx", js_func(get_var(".") %>% js_prop("hp"))) %>%
    attr("cy", js_func(get_var(".") %>% js_prop("disp"))) %>%
    attr("r", js_func(get_var(".") %>% js_prop("mpg"))) %>%
    attr('pointer-events', 'all') %>%
    style("fill", url(get_var("dots"))) %>%
    on("mouseover", js_func(d3() %>% select(this()) %>% style("fill", url(get_var("dashed"))))) %>%
    on("mouseout", js_func(d3() %>% select(this()) %>% style("fill", url(get_var("dots")))))
  execute(i)
}
draw_many(mtcars)

multiple_circles <- function(r) {
  dataset <- data.frame(
    r = r,
    cx = 25 + 50 * 1:length(r),
    stroke = r / 4
  )
  i <- list()
  i$i1 <- d3() %>%
    select("body") %>%
    append("svg") %>%
    attr("width", 500) %>%
    attr("height", 500) %>%
    selectAll("circle") %>%
    data(dataset) %>%
    enter() %>%
    append("circle") %>%
    attr("cx", js_func(get_var(".") %>% js_prop("cx"))) %>%
    attr("cy", 50) %>%
    attr("r", js_func(get_var(".") %>% js_prop("r"))) %>%
    attr("fill", "yellow") %>%
    attr("stroke", "orange") %>%
    attr("stroke-width", js_func(get_var(".") %>% js_prop("stroke")))
  execute(i)
}
multiple_circles(seq(5,25,5))

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
  i$i2 <- textures() %>%
    lines() %>%
    thicker() %>%
    save_var("dashed")
  i$i3 <- get_var("svg") %>%
    call(get_var("dashed"))
  i$i4 <- get_var("svg") %>%
    selectAll("rect") %>%
    data(dataset) %>%
    enter() %>%
    append("rect") %>%
    attr("width", 25) %>%
    attr("height", js_func(get_var(".") %>% js_prop("height"))) %>%
    attr("x", js_func(get_var(".") %>% js_prop("x"))) %>%
    attr("y", js_func(get_var(".") %>% js_prop("y"))) %>%
    style("fill", "black") #url(get_var("dashed")))
  execute(i)
}
d3_bar_chart(c(25, 7, 5, 26, 11))
d3_bar_chart(c(5, 10, 15, 20, 25))
d3_bar_chart(c(25, 7, 5, 26, 11, 8, 25, 14, 23, 19, 14, 11, 22, 29, 11, 13, 12, 17, 18, 10, 24, 18, 25, 9, 3))
sample(30, 25, replace = T) %>% d3_bar_chart()

