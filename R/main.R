#' @import htmlwidgets
#' @export

library(magrittr)

execute <- function(insts, css = "") {
  names(insts) <- 1:length(insts)
  args <- list(
    insts = insts,
    css = css
  )
  htmlwidgets::createWidget("r2d3", args, width = NULL, height = NULL)
}

createFunction <- function(funName) {
  print(funName)
  function(insts, ...) {
    insts[[length(insts) + 1]] <- list(command = "apply", fun = funName, args = list(...))
    insts
  }
}
save_var <- function(insts, name) {
  insts[[length(insts) + 1]] <- list(command = "save_var", args = list(name = name))
  insts
}

js_func <- function(...) {
  list(list(command = "js_func", args=list(blocks = ...)))
}
js_prop <- function(insts, prop_name) {
  insts[[length(insts) + 1]] <- list(command = "js_prop", args = list(name = prop_name))
  insts
}
get_var <- function(name) {
  list(list(command = "get_var", args=list(name = name)))
}
evaluate <- function(str) {
  list(list(command = "evaluate", args = list(str=str)))
}
this <- function() { get_var("this") }
d3 <- function() { get_var("d3") }
textures <- function() { get_var("textures") }

js_funs <- c("call", "log")
d3_funs <- c("select", "selectAll", "append", "data", "text", "pipeline", "clearRect", "satellite", "save",
             "translate", "beginPath", "stroke", "restore", "sink", "scale",
             "enter", "attr", "style", "on", "getContext", "node", "pipe", "source", "geo", "graticule", "timer")
textures_funs <- c("url", "lines", "thicker", "heavier", "thinner", "size", "strokeWidth", "circles", "radius", "size")
register_functions <- c(js_funs, d3_funs, textures_funs)
for(funName in register_functions) {
  assign(funName, createFunction(funName))
}
