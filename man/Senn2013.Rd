\name{Senn2013}
\docType{data}
\alias{Senn2013}

\title{Studies on Diabetes Treatments}

\description{
Results from 26 trials evaluating treatments for diabetes.
}

\usage{Senn2013}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}     \tab \code{character} \tab study ID \cr
\bold{treatment} \tab \code{character} \tab treatment \cr
\bold{n}         \tab \code{integer}   \tab sample size \cr
\bold{mean}      \tab \code{numeric}   \tab mean \cr
\bold{sd}        \tab \code{numeric}   \tab standard deviation \cr
\bold{type}      \tab \code{character} \tab outcome type \cr
\bold{author}    \tab \code{character} \tab first author \cr
\bold{year}      \tab \code{numeric}   \tab first author \cr
}
}

\details{
This network meta-analysis compared the effectiveness of nine active treatments
and placebo in patients with diabetes (Senn et al., 2013). Patients enrolled in
26 studies included in this data set were treated to reduce blood glucose
(HBA1c) levels. The effect measure was the mean difference of average plasma
glucose concentration HbA1C and measured in mmol / mol. The outcome was either
measured as a change score or post intervention (variable type).
}

\source{
Senn S, Gavini F, Magrez D, Scheen A (2013):
Issues in performing a network meta-analysis.
\emph{Statistical Methods in Medical Research},
\bold{22}, 169--89
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("netmeta", quietly = TRUE)) {
# Load netmeta package
library("netmeta")

# Print mean differences with two digits
oldset <- settings.meta(digits = 2)

# Transform data from long arm-based format to contrast-based
# format.
pw1 <- pairwise(studlab = study, treat = treatment,
  n = n, mean = mean, sd = sd, data = Senn2013,
  varnames = c("MD", "seMD"))

# Conduct network meta-analysis
nma1 <- netmeta(pw1, random = FALSE,
  reference.group = "placebo")
nma1

# Draw network graph
netgraph(nma1, seq = "optimal", multiarm = TRUE,
  cex = 1.5, lwd = 7, rotate = -1 / n * 360,
  pch.points = 21, bg.points = "lightblue",
  cex.points = n.trts, points.max = 10,
  labels = paste0(trts, "\n(n=", n.trts, ")"),
  offset = 0.045)

# Use previous settings
settings.meta(oldset)
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{diabetes}
\concept{mean differences}
\concept{network meta-analysis}
\section{Concepts}{medicine, diabetes, mean differences, network meta-analysis}
