\name{INDANA_2y_resp}
\docType{data}
\alias{INDANA_2y_resp}

\title{Responders in Studies on Systolic Blood Pressure}

\description{
Results from seven trials evaluating the treatment effect on systolic blood
pressure two years post randomisation. Responders are defined as patients
with a lower systolic blood pressure after two years.
}

\usage{INDANA_2y_resp}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{trial}     \tab \code{character} \tab trial label \cr
\bold{resp.exp}  \tab \code{numeric}   \tab responders in experimental group \cr
\bold{fail.exp}  \tab \code{numeric}   \tab failures in experimental group \cr
\bold{miss.exp}  \tab \code{numeric}   \tab missing observations in experimental group \cr
\bold{resp.plac} \tab \code{numeric}   \tab responders in placebo group \cr
\bold{fail.plac} \tab \code{numeric}   \tab failures in placebo group \cr
\bold{miss.plac} \tab \code{numeric}   \tab missing observations in placebo group \cr
}
}

\details{
This data set comes from seven trials evaluating the treatment effect on
systolic blood pressure two years post randomisation. Responders are defined as
patients with a lower systolic blood pressure after two years.
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("meta", quietly = TRUE)) {
library("meta")
ma <- metabin(resp.exp, resp.exp + fail.exp,
  resp.plac, resp.plac + fail.plac,
  data = INDANA_2y_resp, studlab = trial)
#
ma
}
}
}

\keyword{data sets}
