% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as-ped.R
\name{as_ped}
\alias{as_ped}
\alias{as_ped.data.frame}
\alias{as_ped.nested_fdf}
\alias{as_ped.list}
\alias{is.ped}
\title{Transform data to Piece-wise Exponential Data (PED)}
\usage{
as_ped(data, formula, ...)

\method{as_ped}{data.frame}(data, formula, cut = NULL, max_time = NULL,
  ...)

\method{as_ped}{nested_fdf}(data, formula, ...)

\method{as_ped}{list}(data, formula, ...)

is.ped(x)
}
\arguments{
\item{data}{Either an object inheriting from data frame or in case of
time-dependent covariates a list of data frames, where the first data frame
contains the time-to-event information and static covariates while the second
(and potentially further data frames) contain information on time-dependent
covariates and the times at which they have been observed.}

\item{formula}{A two sided formula with a \code{\link[survival]{Surv}} object
on the left-hand-side and covariate specification on the right-hand-side (RHS).
The RHS can be an extended formula, which specifies how TDCs should be transformed
using specials \code{concurrent} and \code{cumulative}.}

\item{...}{Further arguments passed to the \code{data.frame} method and
eventually to \code{\link[survival]{survSplit}}}

\item{cut}{Break points, used to partition the follow up into intervals.
If unspecified, all unique event times will be used.}

\item{max_time}{If \code{cut} is unspecified, this will be the last
possible event time. All event times after \code{max_time}
will be administratively censored at \code{max_time}.}

\item{x}{any R object.}
}
\value{
A data frame class \code{ped} in piece-wise exponential data format.
}
\description{
This is the general data transformation function provided by the
\code{pammtools} package. Two main applications must be distinguished:
\enumerate{
 \item Transformation of standard time-to-event data.
 \item Transformation of time-to-event data with time-dependent covariates (TDC).
}
For the latter, the type of effect one wants to estimate is also
important for the data transformation step.
In any case, the data transformation is specified by a two sided formula.
In case of TDCs, the right-hand-side of the formula can contain formula specials
\code{concurrent} and \code{cumulative}.
See the \href{https://adibender.github.io/pammtools//articles/data-transformation.html}{data-transformation}
vignette for details.
}
\examples{
tumor[1:3, ]
tumor[1:3, ] \%>\% as_ped(Surv(days, status)~ age + sex, cut = c(0, 500, 1000))
tumor[1:3, ] \%>\% as_ped(Surv(days, status)~ age + sex)
}
