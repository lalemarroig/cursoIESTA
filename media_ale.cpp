#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
double media_ale(NumericVector x) {
  int n = x.size();
  double tot = 0.0;
  
  for (int i=0; i<n; ++i) {
   tot += x[i];
  }
  return tot / n;
}



