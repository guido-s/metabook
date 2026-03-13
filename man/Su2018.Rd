\name{Su2018}
\docType{data}
\alias{Su2018}

\title{Studies on Interventions for Patients with Periodontal Infrabony Lesions}

\description{
Results from 52 trials comparing guided tissue regeneration,
enamel matrix derivatives, and their combination therapies or patients with
periodontal infrabony lesions.
}

\usage{Su2018}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}     \tab \code{numeric}   \tab study ID \cr
\bold{study}  \tab \code{character} \tab study label \cr
\bold{trt}    \tab \code{character} \tab treatment \cr
\bold{n}      \tab \code{numeric}   \tab number of individuals \cr
\bold{change} \tab \code{numeric}   \tab change in clinical attachment level \cr
\bold{sd}     \tab \code{numeric}   \tab standard deviation \cr
\bold{author} \tab \code{character} \tab first author \cr
\bold{year}   \tab \code{numeric}   \tab year of publication \cr
}
}

\details{
This data set comes from a systematic review of randomized controlled trials on
eight interventions for patients with periodontal infrabony lesions
(Su and Tu, 2018). The continuous outcome was change in clinical attachment
between baseline and 12 months after treatment. The studies either used a
parallel or split-mouth design.
}

\source{
Su Y, Tu Y (2018):
Statistical approaches to adjusting weights for dependent arms in
network meta-analysis.
\emph{Research Synthesis Methods},
\bold{9}, 431--40.
\doi{10.1002/jrsm.1304}
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("netmeta", quietly = TRUE)) {
# Load netmeta package
library("netmeta")

# Transform data from long arm-based format to contrast-based format
pw <- pairwise(trt, n = n, mean = change, sd = sd,
  data = Su2018, studlab = study)


# Conduct random effects network meta-analysis (NMA) with
# - flap operation as reference
# - results from split-mouth designs as correlated outcomes
nma <- netmeta(pw, common = FALSE, reference = "Flap op",
  correlated = design == "split")

# Show network graph
netgraph(nma, seq = "o")

# Print results for network meta-analysis
nma
}
}
}

\keyword{data sets}
\concept{dentistry}
\concept{correlated}
\concept{mean differences}
\concept{network meta-analysis}
\section{Concepts}{dentistry, correlated, mean differences, network meta-analysis}
