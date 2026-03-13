\name{Hamza2021}
\docType{data}
\alias{Hamza2021}

\title{Antidepressants Dataset for Dose-Response Network Meta-Analysis}

\description{
Results from 170 trials examining 20 antidepressants and placebo in adults with
major depressive disorder.
}

\usage{Hamza2021}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}         \tab \code{numeric}   \tab study ID \cr
\bold{drug}       \tab \code{character} \tab treatment \cr
\bold{dose}       \tab \code{numeric}   \tab drug dose \cr
\bold{resp}       \tab \code{numeric}   \tab number of responders in treatment arm \cr
\bold{total}      \tab \code{numeric}   \tab sample size in treatment arm \cr
\bold{rob}        \tab \code{character} \tab risk of bias (low / high) \cr
\bold{age}        \tab \code{numeric}   \tab mean age in treatment arm \cr
\bold{year}       \tab \code{numeric}   \tab year of publication \cr
\bold{year.c}     \tab \code{numeric}   \tab year centered around 2010 \cr
\bold{class}      \tab \code{character} \tab drug class \cr
\bold{dose_label} \tab \code{ordered}   \tab drug dose as licensed or lower / higher \cr
\bold{dose_flux}  \tab \code{numeric}   \tab fluoxetine-equivalent dose \cr
\bold{varlnOR}    \tab \code{character} \tab variance of log odds ratio (comparison to reference) \cr
}
}

\details{
This dataset goes back to the network meta-analysis by Cipriani et al. (2018)
evaluting 20 antidepressants and placebo in adults with major depressive
disorder. The primary outcome is the response rate, defined as the proportion
of patients achieving at least a 50\% reduction in symptoms.

The dataset and code to conduct a Bayesian dose-response network meta-analyis
is publicly available on Zenodo (Hamza et al., 2021). The data have been
used in two methodological publications on statistical methods for
dose-response network meta-analysis
(Hamza et al., 2024; Petropoulou et al., 2025). A reduced version of this
data set is available in R package \bold{netdose} under the name
'antidepressants'.

The data set is in long arm-based format, i.e., one treatment arm per row.
}

\source{
Hamza T, Furukawa TA, Orsini N, Cipriani A, Iglesias C, Salanti G  (2021):
A dose-effect network meta-analysis model: an application in antidepressants.
\emph{Zenodo}.
\doi{10.5281/zenodo.5866456}
}

\references{
Cipriani A et al. (2018):
Comparative efficacy and acceptability of 21 antidepressant drugs for the
acute treatment of adults with major depressive disorder: a systematic review
and network meta-analysis.
\emph{Lancet},
\bold{391}, 1357--66

Hamza T, Furukawa TA, Orsini N, Cipriani A, Iglesias CP, Salanti G (2024):
A dose–effect network meta-analysis model with application in antidepressants
using restricted cubic splines.
\emph{Statistical Methods in Medical Research},
\bold{33}, 1461--72

Petropoulou M, Rücker G, Schwarzer G (2026):
Network meta-analysis with dose-response relationships.
\emph{BMC Medical Research Methodology},
\bold{26}, 17
}

\examples{
\donttest{
if (requireNamespace("netdose", quietly = TRUE)) {
# Load netdose package
library("netdose")

pw <- pairwise(agent = drug, dose = dose, studlab = id,
  event = resp, n = total, data = Hamza2021, sm = "OR")

\dontrun{
# Do not execute without user input due to the long run time
drnma.quad <- netdose(TE, seTE, agent1, dose1, agent2, dose2, studlab,
  data = pw, method = "quadratic")
dotplot(drnma.quad)
plot(drnma.quad)
}
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{depression}
\concept{odds ratios}
\concept{component network meta-analysis}
\section{Concepts}{medicine, depression, odds ratios, component network meta-analysis}
