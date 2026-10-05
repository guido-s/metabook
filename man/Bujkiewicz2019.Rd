\name{Bujkiewicz2019}
\docType{data}
\alias{Bujkiewicz2019}

\title{Trials on Treatment Options in Advanced Colorectal Cancer}

\description{
Results on progression-free survival and tumor response after therapy from
51 trials evaluating chemotherapy alone versus chemotherapy combined with other
treatments in patients with advanced colorectal cancer.
}

\usage{Bujkiewicz2019}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{id}          \tab \code{integer}   \tab study ID \cr
\bold{study}       \tab \code{character} \tab study label \cr
\bold{trt}         \tab \code{character} \tab treatment label \cr
\bold{combination} \tab \code{character} \tab treatment combination \cr
\bold{n}           \tab \code{integer}   \tab group sample size \cr
\bold{resp}        \tab \code{integer}   \tab number of treatment responders \cr
\bold{lnHR}        \tab \code{numeric}   \tab log hazard ratio \cr
\bold{lnseHR}      \tab \code{numeric}   \tab standard error of log hazard ratio \cr
\bold{incl_sens}   \tab \code{logical}   \tab include in sensitivity analysis \cr
}  
}

\details{
Bujkiewicz et al. (2019) describe a Bayesian network meta-analysis model for
surrogate endpoint evaluation. A network with 51 trials evaluating chemotherapy
alone versus chemotherapy combined with other treatments in patients with
advanced colorectal cancer is used as an example.

Treatment options are

\tabular{ll}{
A \tab chemotherapy alone (reference) \cr
B \tab anti-VEGF + chemotherapy \cr
C \tab EGFRi + chemotherapy \cr
D \tab EGFRi + anti-VEGF + chemotherapy \cr
E \tab anti-IGF1R + chemotherapy \cr
F \tab anti-IgG2 + EGFRi + chemotherapy \cr
}

with treatment components

\tabular{ll}{
anti-VEGF \tab antiangiogenic treatments targeting vascular endothelial growth factor \cr
EGFRi \tab epidermal growth factor receptor inhibitor \cr
anti-IGF1R \tab antibody targeting the type 1 insulin-like growth factor receptor \cr
anti-IgG2 \tab antibody targeting integrin receptor \cr
}

The outcomes are progression-free survival and tumor response after therapy
which are both available in all 51 trials. One double-zero trials is removed
from the network meta-analysis of tumor response.
}

\source{
Bujkiewicz S, Jackson D, Thompson JR, et al. (2019):
Bivariate network meta-analysis for surrogate endpoint evaluation. 
\emph{Statistics in Medicine},
\bold{38}, 3322--3341
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("mvnma", quietly = TRUE)) {
# Load mvnma package
library("mvnma")

# Contrast based outcome data for progression free survival
#
pw1 <- pairwise(trt, TE = lnHR, seTE = selnHR, n = n, studlab = id,
  data = Bujkiewicz2019, relative.effects = TRUE, sm = "HR")

# Arm based outcome data for tumor Response
#
pw2 <- pairwise(trt, event = resp, n = n, studlab = id,
  data = Bujkiewicz2019, sm = "OR")

# Check connectivity
#
nc1 <- netconnection(pw1)
nc2 <- netconnection(pw2)
#
nc1
nc2

# Network graphs
#
netgraph(nc1, seq = "o")
netgraph(nc2, seq = "o")

# Make results reproducible
#
set.seed(1905)

# Conduct multivariate network meta-analysis
#
outcomes <- c("Progression-free survival", "Tumor response")
#
mvnma12 <- mvnma(pw1, pw2,
  reference.group = "A", outclab = outcomes)

# Results similar to models 1d and 2d in the supplementary Table 3
# (Bujkiewicz et al., 2019)
#
mvnma12
forest(mvnma12)

# Calculate SUCRAs (not shown in main manuscript)
#
mvr1 <- mvrank(mvnma12, small.values = c("desirable", "undesirable"))
mvr1

# VIKOR calculated from multivariate network meta-analysis
#
vikor(mvr1)

# Compare with results using frequentist approach in netmeta
#
nma1 <- netmeta(pw1, common = FALSE, backtransf = FALSE,
  reference.group = "A", small.values = "desirable")
nma2 <- netmeta(pw2, common = FALSE, backtransf = FALSE,
  reference.group = "A", small.values = "undesirable")
#
forest(nma1)
forest(nma2)
#
nr1 <- netrank(nma1, method = "sucra")
nr2 <- netrank(nma2, method = "sucra")
#
nr1
nr2

# VIKOR calculated from univariate network meta-analyses
#
np12 <- netposet(nr1, nr2, outcomes = outcomes)
vikor(np12)
}
}
}

\keyword{data sets}
\concept{oncology}
\concept{hazard ratios}
\concept{odds ratios}
\concept{survival analysis}
\section{Concepts}{oncology, hazard ratios, odds ratios, survival analysis}
