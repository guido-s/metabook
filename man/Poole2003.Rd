\name{Poole2003}
\docType{data}
\alias{Poole2003}
\title{Trials on Mucolytic Agents in Chronic Bronchitis or Chronic Obstructive Pulmonary Disease}
\description{Results from 19 trials evaluating mucolytic agents in patients with chronic bronchitis or chronic obstructive pulmonary disease.}
\usage{
Poole2003
}
\format{
The data frame contains the following columns:
\tabular{lll}{
\bold{author} \tab \code{character} \tab first author \cr
\bold{year} \tab \code{integer} \tab publication year \cr
\bold{Ne} \tab \code{integer} \tab sample size (mucolytic agents) \cr
\bold{Me} \tab \code{numeric} \tab mean exacerbations per months (mucolytic agents) \cr
\bold{Se} \tab \code{numeric} \tab standard deviation (mucolytic agents)  \cr
\bold{Nc} \tab \code{integer} \tab sample size (placebo) \cr
\bold{Mc} \tab \code{numeric} \tab mean exacerbations per months (placebo) \cr
\bold{Sc} \tab \code{numeric} \tab standard deviation (placebo) \cr
\bold{duration} \tab \code{character} \tab study duration \cr
}  
}
\details{
Poole and Black (2003) conducted a Cochrane review to evaluate mucolytic agents versus placebo for patients with chronic bronchitis or chronic obstructive pulmonary disease. The outcome used here is the mean number of acute exacerbations per month. Acute exacerbation is defined as an increase in cough and in the volume or purulence of sputum. All 17 studies included in the meta-analysis report a mean number of exacerbations and we can work with mean differences, rather than standardised mean differences. Note, later versions of this Cochrane review no longer evaluate the mean number of exacerbations per month.

This data set is used as an example in Schwarzer et al. (2015).
}
\source{
Poole, P.J., Black, P.N. (2003). Mucolytic agents for chronic bronchitis or chronic obstructive pulmonary disease. \emph{Cochrane Database of Systematic Reviews}, \bold{1}, \doi{10.1002/14651858.CD001287}
}
\references{
Schwarzer, G., Carpenter, J. R., & Rücker, G. (2015). \emph{Meta-analysis with R}. Cham, Switzerland: Springer.
}
\author{
Guido Schwarzer, \email{guido.schwarzer@uniklinik-freiburg.de}
}
\examples{
\donttest{
if (requireNamespace("meta", quietly = TRUE)) {
# Load meta package
library("meta")

# Use RevMan 5 settings
oldset <- settings.meta("RevMan5",
  digits.I2 = 2, digits.tau = 3, digits.sd = 2)

# Conduct random effects meta-analysis
m <- metacont(Ne, Me, Se, Nc, Mc, Sc, data = Poole2003,
  studlab = paste(author, year), common = FALSE,
  subgroup = duration,
  subgroup.name = "Duration", sep.subgroup = ": ",
  label.e = "Mucolytic agent",
  label.c = "Placebo",
  label.left = "Favours mucolytic agent",
  label.right = "Favours placebo",
  col.label.left = "green", col.label.right = "red")

# Forest plot
forest(m, xlim = c(-0.5, 0.2),
  xlab = paste0("Difference in mean number of\n",
    "acute exacerbations per month"))

# Use previous settings
settings.meta(oldset)
}
}
}

\keyword{data sets}
\concept{medicine}
\concept{mean differences}
\concept{subgroup analysis}
\section{Concepts}{medicine, mean differences, subgroup analysis}
