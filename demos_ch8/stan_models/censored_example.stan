data {
  int<lower=0> N_obs;
  int<lower=0> N_cens;
  real y_obs[N_obs];
  real<lower=max(y_obs)> U;
}
parameters {
  real theta;
  real<lower=0> sigma;
}
model { 
  y_obs ~ normal(theta, sigma);
  target += N_cens * normal_lccdf(U | theta, sigma);
}