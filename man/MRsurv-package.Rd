\name{MRsurv-package}
\alias{MRsurv-package}
\alias{MRsurv}
\docType{package}
\title{
Multiplicative-regression model for relative survival.
}
\description{
This package computes multiplicative-regression model for relative survival.
}
\details{
Relative survival models are traditionally used in the evaluation of mortality related to chronic diseases, taking into account the expected mortality of general population (life table by gender, calendar year and age). Here, we propose here an adaptation of a multiplicative-regression model for relative survival to study the heterogeneity of risk factors between two groups of patients. These developments were motivated by the analysis of factors associated with the time to graft failure (return-to-dialysis or patient death) in second kidney transplant recipients compared to first kidney transplant recipients. The parameters' estimation is based on partial likelihood maximization and Monte-Carlo simulations associated with bootstrap re-sampling yields to obtain the corresponding standard deviations.

\tabular{ll}{
Package: \tab MRsurv\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2013-10-31\cr
License: \tab GPL (>=2)\cr
LazyLoad: \tab yes\cr
}


\tabular{rl}{
MRsurvival \tab Compute a MRS model to compare the risk factors between a \cr
 \eqn{ \mbox{ } } \tab reference and a relative population. \cr
FTR.data \tab These data were extracted from the DIVAT data bank for first \cr
 \eqn{ \mbox{ } }  \tab kidney transplant recipients (reference group).\cr
STR.data \tab These data were extracted from the DIVAT data bank for second \cr
 \eqn{ \mbox{ } }  \tab kidney transplant recipients (relative group).\cr
}
}
\author{
Y. Foucher <Yohann.Foucher@univ-nantes.fr>

and K. Trebern-Launay <katygre@yahoo.fr>
}
\references{
Andersen P, Borch-Johnsen K, Deckert T, Green A, Hougaard P, Keiding N, Kreiner S. A cox regression model for the relative mortality and its application to diabetes mellitus survival data. Biometrics Dec 1985; 41(4):921-932.

K. Trebern-Launay, M. Giral, J. Dantal and Y. Foucher. Comparison of the risk factors effects between two populations: two alternative approaches illustrated by the analysis of first and second kidney transplant recipients. BMC Med Res Methodol. 2013 Aug 6;13:102.
}

\keyword{ relative survival }
\keyword{ package }

\seealso{
URL: http://www.divat.fr
}
