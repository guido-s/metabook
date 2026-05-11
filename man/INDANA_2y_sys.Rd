\name{INDANA_2y_sys}
\docType{data}
\alias{INDANA_2y_sys}

\title{Studies on Systolic Blood Pressure}

\description{
Results from seven trials evaluating the treatment effect on systolic blood
pressure two years post randomisation.
}

\usage{INDANA_2y_sys}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}    \tab \code{character} \tab study label \cr
\bold{group}    \tab \code{character} \tab treatment \cr
\bold{mean.sys} \tab \code{numeric}   \tab systolic blood pressure (mmHG) \cr
\bold{sd.sys}   \tab \code{numeric}   \tab standard deviation of systolic blood pressure \cr
\bold{nobs}     \tab \code{numeric}   \tab number of observations \cr
\bold{nmiss}     \tab \code{numeric}  \tab number of missing observations \cr
}
}

\details{
This data set comes from seven trials evaluating the treatment effect on
systolic blood pressure two years post randomisation.
}

\source{
INDANA_2y_sys
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("meta", quietly = TRUE)) {
library("meta")
pw <- pairwise(group, n = nobs, mean = mean.sys, sd = sd.sys,
  data = INDANA_2y_sys, studlab = trial,
  reference.group = "placebo")
#
summary(metagen(pw))
}
}
}

\keyword{data sets}
