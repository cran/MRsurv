\name{MRsurvival}
\alias{MRsurvival}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multiplicative-regression model to compare the risk factors between a reference and relative populations.
}
\description{
Compute a MRS model to compare the risk factors between a reference and a relative population.
}
\usage{
MRsurvival(time.ref, status.ref, cov.rel, data.rel, cox.ref, cov.ref, init, B)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{time.ref}{The column name of the data frame \code{data.rel}, in which the time of follow-up of each individual is collected.}
  \item{status.ref}{The column name of the data frame \code{data.rel}, in which the indicator of event at the end of follow-up is collected (1 if the event is observed and 0 if right censoring).}
  \item{cov.rel}{The column(s) name(s) of the data frame declared in \code{data.rel} in order to declare the explicative variable included in the multiplicative relative model.}
  \item{data.rel}{A data frame with the variables (columns) of the individuals (raw) of the relative sample.}
  \item{cox.ref}{The results of the Cox model performed in the reference sample, i.e an object obtained by the \code{coxph} function.}
  \item{cov.ref}{The column(s) name(s) of the data frame \code{data.rel} in order to declare the explicative variable corresponding to those included in the Cox model \code{cox.ref}. Please, note that the order of these variables is important and have to be similar with the order in \code{cox.ref}.}
  \item{init}{A vector with the same length than \code{cov.rel} with the initial values for the parameters to be optimized.}
  \item{B}{The number of iterations of the bootstrap resampling.}
  }
\details{
We proposed here an adaptation of a multiplicative-regression model for relative survival to study the heterogeneity of risk factors between two groups of patients. Estimation of parameters is based on partial likelihood maximization and Monte-Carlo simulations associated with bootstrap re-sampling yields to obtain the corresponding standard deviations.  The expected hazard ratios are obtained by using a PH Cox model. 
}
\value{
\item{matrix.coef}{A matrix containing the parameters estimations at each of the B iterations.}
\item{estim.coef}{A numerical vector containing the mean of the previous estimation}
\item{lower95.coef}{A numerical vector containing the lower bounds of the 95\% confidence intervals.}
\item{upper95.coef}{A numerical vector containing the upper bounds of the 95\% confidence intervals.}
}
\references{
Andersen P, Borch-Johnsen K, Deckert T, Green A, Hougaard P, Keiding N, Kreiner S. A cox regression model for the relative mortality and its application to diabetes mellitus survival data. Biometrics Dec 1985; 41(4):921-932.

K. Trebern-Launay, M. Giral, J. Dantal and Y. Foucher. Comparison of the risk factors effects between two populations: two alternative approaches illustrated by the analysis of first and second kidney transplant recipients. BMC Med Res Methodol. 2013 Aug 6;13:102.
}
\author{
Y. Foucher <Yohann.Foucher@univ-nantes.fr>

K. Trebern-Launay <katygre@yahoo.fr>
}

\examples{

# import and attach both samples
data(FTR.data)
data(STR.data)

# We reduce the dimension to save time for this example (CRAN policies)
STR.data <- STR.data[1:100,]

# Compute the Cox model in the reference sample (FTR)
cox.FTR<-coxph(Surv(Tps.Evt, Evt)~ ageR2cl + sexeR, data=FTR.data)
summary(cox.FTR)


# Compute the multiplicative relative model (STR)
mrs.STR <- MRsurvival(time.ref="Tps.Evt", status.ref="Evt",
 cov.rel=c("ageR2cl", "Tattente2cl"),
 data.rel=STR.data, cox.ref=cox.FTR, cov.ref=c("ageR2cl", "sexeR"),
 init=c(0,0), B=5)
  # Of course, choose B>>5 for real applications
  
# The values at each iteration
mrs.STR$matrix.coef

# The parameters estimations (mean of the values)
mrs.STR$estim.coef 
apply(mrs.STR$matrix.coef, FUN="mean", MARGIN=2)

# The 95% confidence intervals
cbind(mrs.STR$lower95.coef, mrs.STR$upper95.coef) 
}

\keyword{ relative survival }
\keyword{ multiplicative regression }
\keyword{ partial likelihood }
