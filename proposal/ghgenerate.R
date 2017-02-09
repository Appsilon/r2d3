proposal<-"r2d3 - R domain specific language for D3.js"
proposal.file<-"isc-proposal.Rmd"
author<-"Filip Stachura, Marek Rogala, Olga Mierzwa-Sulima,  Krzysztof Wróbel on behalf of Appsilon Data Science company. Contact email: hello@appsilondatascience.com; contact number: +48 509 125 362"

rmarkdown::render(proposal.file, output_format="html_document",
                  output_dir="out", quiet=TRUE)
rmarkdown::render(proposal.file, output_format="pdf_document",
                  output_dir="out", quiet=TRUE)
