\name{Tian2009}
\docType{data}
\alias{Tian2009}

\title{
Studies on the Effect of Rosiglitazone on the Risk of Myocardial
Infarction and Death from Cardiovascular Causes
}

\description{
Results from 48 trials examining the effect of rosiglitazone on the risk of
myocardial infarction and death from cardiovascular causes.
}

\usage{Tian2009}

\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{study}      \tab \code{character} \tab study ID \cr
\bold{group}      \tab \code{character} \tab treatment group (rosiglitazone or control) \cr
\bold{int}        \tab \code{character} \tab intervention group, i.e., combination of drug classes \cr
\bold{int.drug}   \tab \code{character} \tab intervention group with drug names instead of classes \cr
\bold{phase}      \tab \code{integer}   \tab phase of clinical trial \cr
\bold{duration}   \tab \code{integer}   \tab duration of the trial (in weeks) \cr
\bold{n.all}      \tab \code{integer}   \tab number of patients \cr
\bold{n}          \tab \code{integer}   \tab number of patients with information on outcomes \cr
\bold{deaths}     \tab \code{integer}   \tab number of deaths \cr
\bold{infarcts}   \tab \code{integer}   \tab number of myocardial infarctions \cr
\bold{type}       \tab \code{character} \tab study types as in Table 1 from Nissen and Wolski (2007) \cr
\bold{population} \tab \code{character} \tab details on the trial population \cr
\bold{period}     \tab \code{character} \tab trial period \cr
\bold{age}        \tab \code{numeric}   \tab mean age (in years) \cr
\bold{male}       \tab \code{numeric}   \tab percentage of males \cr
\bold{hemoglobin} \tab \code{numeric}   \tab mean baseline glycated hemoglobin level \cr
}
}

\details{
Nissen and Wolski (2007) performed a meta-analysis of trials examining the
effect of rosiglitazone on the risk of myocardial infarction and death from
cardiovascular causes.

The present dataset by Tian et al. (2009) is based on this meta-analysis, but
includes six additional trials where no event was observed in either group for
both outcomes. The data set is in long arm-based format.
}

\source{
Tian L, Cai T, Pfeffer MA, Piankov N, Cremieux PY, Wei LJ (2009):
Exact and efficient inference procedure for meta-analysis and its application
to the analysis of independent 2 x 2 tables with all available data but without
artificial continuity correction.
\emph{Biostatistics},
\bold{10}(2), 275--281. \doi{10.1093/biostatistics/kxn034}
}

\references{
Nissen SE, Wolski K (2007):
Effect of Rosiglitazone on the risk of myocardial infarction and death from
cardiovascular causes.
\emph{New England Journal of Medicine},
\bold{356}(24), 2457-2471. \doi{10.1056/NEJMoa072761}
}

\author{Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}}

\examples{
\donttest{
if (requireNamespace("meta", quietly = TRUE)) {
# Load netmeta package
library("meta")

# Print odds ratios and confidence limits with two digits and define
# labels shown in forest plots
oldset <- settings.meta(digits = 2,
  label.e = "Rosiglitazone", label.c = "Control",
  label.left = "Favors rosiglitazome",
  label.right = "Favors control")

# Transform data from long arm-based format to contrast-based
# format. Argument 'sm' has to be used for odds ratio as summary
# measure; by default the risk ratio is used in metabin() called
# internally.
pw <- pairwise(treat = group, event = deaths, n = n, studlab = study,
  data = Tian2009, sm = "OR", varnames = c("logOR", "selogOR"))

# Fit the inverse variance model
ma_iv <- metabin(pw, method = "Inverse",
  text.common = "IV method (common)", text.random = "IV method (random)")

# Fit the Mantel-Haenszel model
ma_mh <- update(ma_iv, method = "MH", random = FALSE,
  text.common = "MH method (common)")

# Fit the Peto model
ma_peto <- update(ma_iv, method = "Peto", random = FALSE,
  text.common = "Peto method (common)")

# Fit generalized linear mixed models (GLMM)
ma_glmm <- update(ma_iv, method = "glmm", model = "CM.AL",
  text.common = "GLMM (common)", text.random = "GLMM (random)")

if (requireNamespace("brglm2", quietly = TRUE)) {
# Fit the logistic regression model with penalized likelihood (LRP)
ma_plma <- update(ma_iv, method = "LRP",
  text.common = "LRP method (common)", text.random = "LRP method (random)")

# Fit the logistic regression model after excluding double zero studies
ma_plma1 <- update(ma_iv, method = "LRP", exclude = is.na(logOR),
  text.common = "LRP method (common), exclude zeros",
  text.random = "LRP method (random), exclude zeros")
}

# Create forest plot with all results
mm <- metamerge(ma_iv, ma_mh)
mm <- metamerge(mm, ma_peto)
mm <- metamerge(mm, ma_glmm)

if (requireNamespace("brglm2", quietly = TRUE)) {
mm <- metamerge(mm, ma_plma)
mm <- metamerge(mm, ma_plma1)
}

fname <- tempfile(pattern = "forest", fileext = ".pdf")
print(fname)
forest(mm, label.event = "Deaths", xlim = c(0.1, 20), file = fname)

# Use previous settings
settings.meta(oldset)
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{cardiology}
\concept{odds ratios}
\concept{Peto's method}
\concept{generalized linear models}
\section{Concepts}{medicine, cardiology, odds ratios, Peto's method, generalized linear models}
