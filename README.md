# MaizeOmics

This R package imports several omics datasets relevant to Maize and processes them for use in downstream applications.  The intent of this package is to 1) provide reproducable and documented process for cleaning a limited few raw, publically available datasets to make them consistent and well formatted and 2) present this package in such a way that the data can be easily imported and incorporated into later applications.  In addition, having "pre-cleaned" the data means that downstream applications can be run much faster since they don't have to clean this dataset with each run.

## Getting Started

This R project produces data files that are intended to be imported into other projects using [devtools](https://www.r-project.org/nosvn/pandoc/devtools.html).

```
library(devtools)
install_github("jrwalsh/MaizeOmics", force = TRUE)
data("maize.walley.v4mapped.expression", package = "MaizeOmics")
View(maize.walley.v4mapped.expression)
```

You can import the latest version of this package using:
```
install_github("jrwalsh/MaizeOmics", force = TRUE)
```

Or you can use a specific release:
```
install_github("jrwalsh/MaizeOmics@v0.2.1", force = TRUE)
```

## Prerequisites

This code was produced with R v3.4.3 "Kite-Eating Tree". You will need [R](https://www.r-project.org/) and an R editor such as [RStudio](https://www.rstudio.com/). You will need [devtools](https://www.r-project.org/nosvn/pandoc/devtools.html) in order to import these datasets. 

Install devtools from inside the R command console:
```
install.packages("devtools")
```

## Datasets

This package contains 

1) gene expression data from the Kaeppler 2015 paper PMID: 27898762
2) gene expression and protein abundance data from the Walley 2016 PMID: 27540173 (originally aligned to B73v2)
3) gene expression data from the Walley 2016 PMID: 27540173 (aligned to B73v4 by Jesse Walsh)

You can view the available data objects and their descriptions by using:
```
data(package = "MaizeOmics")
```

You can view the help file by using:
```
help(package=MaizeOmics)
```

## Authors

* **Jesse R. Walsh** - [jrwalsh](https://github.com/jrwalsh)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Last updated
This readme was created on 6/20/2018 for v0.2.1
