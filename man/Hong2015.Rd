\name{Hong2015}
\docType{data}
\alias{Hong2015}

\title{Studies on Interventions for Patients with Knee Pain Secondary to Osteoarthritis}

\description{
Results from 54 trials comparing physical therapy interventions
for community-dwelling adults with knee pain secondary to osteoarthritis.
}

\usage{Hong2015}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}              \tab \code{numeric}   \tab study ID \cr
\bold{trt}             \tab \code{character} \tab intervention \cr
\bold{n}               \tab \code{numeric}   \tab number of individuals \cr
\bold{mean_pain}       \tab \code{numeric}   \tab mean (pain outcome) \cr
\bold{sd_pain}         \tab \code{numeric}   \tab standard deviation (pain outcome) \cr
\bold{mean_disability} \tab \code{numeric}   \tab mean (disability outcome) \cr
\bold{sd_disability}   \tab \code{numeric}   \tab standard deviation (disability outcome) \cr
}
}

\details{
This data set comprises 54 trials from a network meta-analysis comparing 11
physical therapy interventions, including 'placebo' and 'no treatment' for
community-dwelling adults with knee pain secondary to osteoarthritis
(Hong et al., 2015).

Two patient-reported continuous outcomes were considered. Pain was reported in
51 studies, whereas disability was only reported in 26 trials. Evidence was
available for all 11 interventions for both outcomes of interest.
}

\source{
Hong H, Chu H, Zhang J, Carlin BP (2016):
A Bayesian missing data framework for generalized multiple outcome mixed
treatment comparisons.
\emph{Research Synthesis Methods},
\bold{7}, 6--22.
\doi{10.1002/jrsm.1153}
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("netmeta", quietly = TRUE)) {
# Load netmeta package
library("netmeta")

# Transform data from long arm-based format to contrast-based format
pw_pain <- pairwise(trt, n = n, mean = mean_pain, sd = sd_pain,
  studlab = id, data = Hong2015)
#
pw_dis <- pairwise(trt, n = n, mean = mean_disability, sd = sd_disability,
  studlab = id, data = Hong2015)

# Conduct random effects network meta-analysis (NMA) with
# - 'no treatment' as reference
# - results from split-mouth designs as correlated outcomes
nma_pain <- netmeta(pw_pain, common = FALSE, reference.group = "No treatment",
  small.values = "desirable")
nma_dis <- netmeta(pw_dis, common = FALSE, reference.group = "No treatment",
  small.values = "desirable")

# P-scores
netrank(nma_pain)
netrank(nma_dis)
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{pain}
\concept{mean differences}
\concept{network meta-analysis}
\section{Concepts}{medicine, pain, mean differences, network meta-analysis}
