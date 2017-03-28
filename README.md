
<link href="http://fonts.googleapis.com/css?family=Lato:300,700,300italic|Inconsolata" rel="stylesheet" type="text/css"> <link href='docs/style.css' rel='stylesheet' type='text/css'>

r2d3
====

R domain specific language for D3.js

Data driven documents in R without predefined wrappers. With this package you can create any visualisation possible in D3 directly with R language.

Note: *We are aware of package with a similar * [*https://github.com/hadley/r2d3*](https://github.com/hadley/r2d3) *, but it is no longer maintained. Only name is the same. Our package is doing a completely different thing than wrapping a D3 for ggplot2. *

Demo
----

``` r
library(r2d3)
library(texturer)
library(magrittr)

r2d3({
  svg <- d3() %>% select("body") %>% append("svg") %>% attr("width", 500) %>% attr("height", 500)
  dashed <- textures() %>% lines() %>% thicker()
  dots <- textures() %>% circles() %>% size(5) %>% radius(2)
 
  svg$call(dashed)
  svg$call(dots)
  
  svg %>%
    selectAll("circle") %>%
    data(mtcars) %>%
    enter() %>%
    append("circle") %>%
    attr("cx", ~ .$hp) %>%
    attr("cy", ~ .$disp) %>%
    attr("r", ~ .$mpg) %>%
    attr('pointer-events', 'all') %>%
    style("fill", dots) %>%
    on("mouseover", ~ d3() %>% select(this) %>% style("fill", dashed)) %>%
    on("mouseout", ~ d3() %>% select(this) %>% style("fill", dots))
})
```

![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)

<br/> <br/> Note: code above will not work with the current version of the package. It is code compatible with our design. Current [working version is here](https://github.com/Appsilon/r2d3/blob/master/examples/texturer_demo.R).

The problem and motivation
--------------------------

It's natural for a data scientist to look for a better data visualisation methods in R. Although there are many greatly supported R packages that allow to create plots (ggplot2, plotly, rbokeh), when it comes to non-standard visualisations like network graphs, bubble or radial charts you have to look for something created by the community.

If you know JavaScript (JS) you might think about wrapping a D3 component into **htmlwidget** and use it in your RMarkdown report or Shiny app. In fact there are many libraries that were already written to wrap a specific D3 components, for instance: [NetworkGraphs](http://christophergandrud.github.io/networkD3/), [BubbleChart](https://github.com/jcheng5/bubbles), [CoffeeWheel](https://github.com/armish/coffeewheel), etc. .

However only some of them generate truly interactive visualisations, other only allow for image or SVG generation. And when it comes to customisations they are very limited, time-consuming and often difficult to do without an appropraite JS knowledge. Since not many data scientists know JS, for the sake of their work, they often resort to manual editing of produced SVG files or static images in PhotoShop. In other case they order visualisations from D3 specialists. Either way it's diffucult, time and cost consuming to use what's currently available on the market.

So in order to tackle the problems of customised, interactive and pleasent data visualisations we are proposing a standardised package wrapping D3, which will allow data scientises to recreate any data visualisation possible in D3 directly with R language. With a D3-like syntax anyone would be able to create visualisations like those below.

<!-- ![](https://s3-us-west-2.amazonaws.com/notion-static/03b7a7a7d48e4298b98157ea9a9cda97/Untitled) -->
<!-- ![](https://s3-us-west-2.amazonaws.com/notion-static/c45064a1ae1f40d7ab0f880a6886239a/Untitled) -->
<!-- ![](https://s3-us-west-2.amazonaws.com/notion-static/bc7c50a46f4a4594b86f3d014f666048/Untitled) -->
How to install?
---------------

**Note! This library is still in its infancy. Api might change in the future.**

At the moment it's possible to install this library through [devtools](https://github.com/hadley/devtools).

    devtools::install_github("Appsilon/r2d3")

To install [previous version]() you can run:

    devtools::install_github("Appsilon/r2d3", ref = "0.1.0")

How to contribute?
------------------

If you want to contribute to this project please submit a regular PR, once you're done with new feature or bug fix.<br>

**Changes in documentation**

Both repository **README.md** file and an official documentation page are generated with Rmarkdown, so if there is a need to update them, please modify accordingly a **README.Rmd** file and run a **build\_readme.R** script to compile it.

Source code
-----------

This library source code can be found on [Appsilon Data Science's](http://appsilondatascience.com) Github: <br> <https://github.com/Appsilon/r2d3>

<script>
document.write('<div class="logo"><a href="http://appsilondatascience.com"><img alt="Appsilon Data Science" src="https://cdn.rawgit.com/Appsilon/website-cdn/gh-pages/logo-white.png"/></a></div>')
</script>
Troubleshooting
---------------

We used the latest versions of dependencies for this library, so please update your R environment before installation.

Future enhacements
------------------

-   translating basic R expressions to JS
-   polishing D3 like syntax R-to-JS runtime
-   support for other D3 based plugins
-   handling exceptions with nice Documentation Urls(e.g. using R specific functions in R2D3)
-   create a documentation
-   write unity tests and basic examples coverage tets
-   CRAN release

Appsilon Data Science
=====================

We Provide End-to-End Data Science Solutions

<a href="http://appsilondatascience.com"><img alt="Appsilon Data Science" src="https://cdn.rawgit.com/Appsilon/website-cdn/gh-pages/logo-white.png" /></a>

Get in touch [dev@appsilondatascience.com](dev@appsilondatascience.com)

<script>
document.write('<a href="https://github.com/Appsilon/r2d3"><img style="position: absolute; margin: 0; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>')
</script>
