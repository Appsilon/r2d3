library(r2d3)
library(magrittr)

sphere <- function() {
  i <- list()

  i$i1 <- d3() %>%
    select(".r2d3") %>%
    append("canvas") %>%
    attr("width", 960) %>%
    attr("height", 500)
  i$i2 <- d3() %>%
    select("canvas") %>%
    save_var("canvas")
  i$i3 <- get_var("canvas") %>% node() %>% save_var("canvasNode")
  i$i4 <- get_var("canvasNode") %>% getContext("2d") %>% save_var("context")

  i$i5 <- d3() %>% js_prop("geo") %>% graticule() %>% call() %>% save_var("graticule") # var graticule = d3.geo.graticule()(),

  timer_function <- js_func(
    evaluate("
            env.context.clearRect(0, 0, 960, 500);
            env.context.save();

            var tilt = (-89 + Math.abs((env['.x'] / 30) % 358 - 179)) * Math.PI / 180,
            alpha = Math.acos(1.4 * Math.cos(tilt) * .99);

            env.context.beginPath();

            env.context.translate(960 / 2, 500 / 2);
            env.context.scale(500, -500);
            env.context.lineWidth = 1 / 500;

            var render = d3.geo.pipeline()
                .source(d3.geo.jsonSource)
                .pipe(d3.geo.rotate, 0, 0, env['.x'] / 3000)
                .pipe(d3.geo.clipCircle, Math.acos(1 / 1.4) - 1e-6)

            if (alpha) render
                .pipe(d3.geo.rotate, 0, Math.PI + tilt, 0)
                .pipe(d3.geo.clipCircle, Math.PI - alpha)
                .pipe(d3.geo.rotate, 0, -Math.PI - tilt, 0);

            render = render
              .pipe(d3.geo.project, d3.geo.satellite(1.4, tilt), .5 / 500)
              .sink(d3.geom.contextSink, env.context)(env.graticule);

            env.context.stroke();
            env.context.restore();")
  )

  i$i6 <- d3() %>% timer(timer_function)

  execute(i)
}

sphere()
