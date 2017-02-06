library(r2d3)
library(texturer)
library(magrittr)

draw_many <- function(a, b, c) {
  dataset <- data.frame(a = a, b = b, c = c)
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
    attr("cx", js_func(get_var(".") %>% js_prop("a"))) %>%
    attr("cy", js_func(get_var(".") %>% js_prop("b"))) %>%
    attr("r", js_func(get_var(".") %>% js_prop("c"))) %>%
    attr('pointer-events', 'all') %>%
    style("fill", url(get_var("dots"))) %>%
    on("mouseover", js_func(d3() %>% select(this()) %>% style("fill", url(get_var("dashed"))))) %>%
    on("mouseout", js_func(d3() %>% select(this()) %>% style("fill", url(get_var("dots")))))
  execute(i)
}

draw_many(mtcars$hp, mtcars$disp, mtcars$mpg)
draw_many(c(200, 50, 100, 200), c(200, 50, 150, 250), c(20, 20, 40, 10))
