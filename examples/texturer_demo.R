library(r2d3)
library(texturer)
library(magrittr)

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
  data(mtcars) %>%
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
