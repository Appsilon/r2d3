proposal<-"r2d3 - R domain specific language for D3.js"
proposal.file<-"isc-proposal.Rmd"
author<-"Filip Stachura, Marek Rogala, Olga Mierzwa-Sulima,  Krzysztof Wróbel"

rmarkdown::render(proposal.file, output_format="html_document",
                  output_dir="out", quiet=TRUE)
rmarkdown::render(proposal.file, output_format="pdf_document",
                  output_dir="out", quiet=TRUE)
