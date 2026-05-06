\name{INDANA}
\docType{data}
\alias{INDANA}

\title{Studies on Systolic and Diastolic Blood Pressure}

\description{
Results from eight trials evaluation the treatment effect on systolic and
diastolic blood pressure one year post randomisation.
}

\usage{INDANA}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}      \tab \code{character} \tab study label \cr
\bold{n}          \tab \code{numeric}   \tab number of individuals \cr
\bold{mean.sys}   \tab \code{numeric}   \tab systolic blood pressure (mmHG) \cr
\bold{var.sys}    \tab \code{numeric}   \tab variance of systolic blood pressure \cr
\bold{mean.dia}   \tab \code{numeric}   \tab diastolic blood pressure (mmHG) \cr
\bold{var.dia}    \tab \code{numeric}   \tab variance of diastolic blood pressure \cr
\bold{covariance} \tab \code{numeric}   \tab covariance \cr
\bold{age}        \tab \code{numeric}   \tab mean age \cr
\bold{year}       \tab \code{numeric}   \tab year of publication \cr
}
}

\details{
This data set comes from eight trials evaluation the treatment effect on systolic and
diastolic blood pressure one year post randomisation.
}

\source{
INDANA
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("mvmeta", quietly = TRUE)) {
# mvmeta example
}
}
}

\keyword{data sets}
\concept{multivariate meta-analysis}
\section{Concepts}{multivariate meta-analysis}
