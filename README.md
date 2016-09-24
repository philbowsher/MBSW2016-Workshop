# Intro to Shiny, R Markdown, & HTML Widgets - Application in Drug Development by Phil Bowsher at the 2016 Midwest Biopharmaceutical Statistics Workshop on Monday, May 16th, 2016

Live Presentation is here:

https://beta.rstudioconnect.com/content/1772/

Summary doc is here:

https://beta.rstudioconnect.com/content/1865/MBSW-doc.html

Presentations and code from workshop.

Requires the following packages from CRAN:

```r
install.packages(c("leaflet", "shiny", "shinydashboard", "rmarkdown", "flex_dashboard", "ggplot2", "plotly", "plyr", "reshape2"))
``` 

To access to the OpenFDA API from R, which uses the jsonlite and magrittr packages, you'll need the devtools package to install it as the library has not yet been added to CRAN, so follow these steps:

```r
install.packages("devtools")
```

Once devtools is installed, you can grab this package:

```r
library("devtools")
devtools::install_github("ropenhealth/openfda")
```
Load it in like any other package:

```r
library("openfda")
```

An up-to-date version of RStudio is also recommended.

R 3.2.5 used for examples.

Links/examples reviewed in the following order:

## **Shiny**

http://shiny.rstudio.com/

    A web application framework for R.

## **R Markdown**

http://rmarkdown.rstudio.com/
  
    R Markdown provides an authoring framework for data science and documents are fully reproducible and support dozens of static and dynamic output formats.

## **HTML Widgets**

http://www.htmlwidgets.org/

    R bindings to JavaScript libraries.
    
## **Applications in Drug Development**

    Live apps, analysis, tools and research.