#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' @import htmlwidgets
#' @export

library(magrittr)

save_var <- function(d3args, name) {
  d3args[[length(d3args) + 1]] <- list(command = "save_var", args = list(name = name))
  d3args
}
execute <- function(insts) {
  names(insts) <- 1:length(insts)
  htmlwidgets::createWidget("r2d3", insts, width = NULL, height = NULL)
}

createFunction <- function(funName) {
  print(funName)
  function(d3args, ...) {
    print(d3args)
    d3args[[length(d3args) + 1]] <- list(command = "apply", fun = funName, args = list(...))
    d3args
  }
}

get_var <- function(name) {
  list(list(command = "get_var", args=list(name = name)))
}
d3 <- function() {
  get_var("d3")
}
textures <- function() {
  get_var("textures")
}

js_funs <- c("call")
d3_funs <- c("select", "selectAll", "append", "data", "text", "enter", "attr", "style")
textures_funs <- c("url", "lines", "thicker", "heavier", "thinner", "size", "strokeWidth", "circles", "radius", "size")

register_functions <- c(js_funs, d3_funs, textures_funs)
for(funName in register_functions) {
  assign(funName, createFunction(funName))
}
