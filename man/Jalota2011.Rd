\name{Jalota2011}
\docType{data}
\alias{Jalota2011}

\title{Studies on Interventions for Pain Prevention of Propofol Injection}

\description{
Results from 102 trials comparing seven drug and non-drug interventions to
prevent pain during propofol injection.
}

\usage{Jalota2011}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}        \tab \code{numeric}   \tab study ID \cr
\bold{study}     \tab \code{character} \tab study label \cr
\bold{trt}       \tab \code{character} \tab treatment \cr
\bold{pain}      \tab \code{numeric}   \tab number of individuals with pain \cr
\bold{n}         \tab \code{numeric}   \tab number of individuals \cr
\bold{author}    \tab \code{character} \tab first author \cr
\bold{year}      \tab \code{numeric}   \tab year of publication \cr
}
}

\details{
This data set comes from a systematic review of randomized controlled trials on
seven drug and non-drug interventions to prevent pain during
propofol injection (Jalota et al., 2011). The binary outcome was pain,
with relative risk (RR) as a measure of effect. 

The core data were extracted from R package \bold{nmadb} using the
command \code{readByID("482001")}.
}

\source{
Jalota L, Kalira V, George E, et al. (2011):
Prevention of pain on injection of propofol: systematic review and
meta-analysis.
\emph{British Medical Journal},
\bold{342}, d1110.
\doi{10.1136/bmj.d1110}.
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("netmeta", quietly = TRUE)) {
# Load netmeta package
library("netmeta")

# Print risk ratios and confidence limits with two digits
oldset <- settings.meta(digits = 2)

# Transform data from long arm-based format to contrast-based
# format. Argument 'sm' is optional as the risk ratio is used by default in
# the metabin function called internally.
pw <- pairwise(trt, pain, n, studlab = study,
  data = Jalota2011, sm = "RR")

# Conduct random effects network meta-analysis (NMA)
# with hand vein as reference
nma <- netmeta(pw, common = FALSE, ref = "Hand vein")

# Show network graph
netgraph(nma, seq = "o", multiarm = TRUE, rotate = 3 / n * 360)

# Print and plot results for network meta-analysis
nma
forest(nma,
  label.left = "Favours other", label.right = "Favours Hand vein")

# Use previous settings
settings.meta(oldset)
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{pain}
\concept{risk ratios}
\concept{network meta-analysis}
\section{Concepts}{medicine, pain, risk ratios, network meta-analysis}
