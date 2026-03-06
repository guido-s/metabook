\name{Senn2024}
\docType{data}
\alias{Senn2024}

\title{Data of n-of-1 Meta-Analysis in Asthma}


\description{
Results from 12 simulated patients in n-of-1 meta-analysis in asthma
(Senn, 2024).
}

\usage{Senn2024}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{patid} \tab \code{integer} \tab patient ID \cr
\bold{n.cycles} \tab \code{numeric} \tab number of cycles \cr
\bold{md} \tab \code{numeric} \tab mean difference \cr
\bold{var.md} \tab \code{integer} \tab variance of mean difference \cr
}  
}

\details{
Senn (2024) simulated data from 12 patients to describe a meta-analysis
method of n-of-1 trials.
}

\source{
Senn S (2024):
The analysis of continuous data from n-of-1 trials using paired cycles:
a simple tutorial.
\emph{Trials},
\bold{25}, 128
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("meta", quietly = TRUE)) {
# Load meta package
library("meta")

mg4 <- metagen(md, sqrt(var.md), cycles = n.cycles,
  data = Senn2024, studlab = paste("Patient", patid),
  sm = "MD", method.tau = "DL")
#
forest(mg4, digits.TE = 2, digits.se = 2,
  digits.sd = 2, digits.tau2 = 1, digits.weight = 2,
  xlim = c(-200, 550), at = c(-200, 0, 200, 400),
  details = TRUE)
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{asthma}
\concept{mean differences}
\concept{n-of-1 meta-analysis}
\section{Concepts}{medicine, asthma, mean differences, n-of-1 meta-analysis}
