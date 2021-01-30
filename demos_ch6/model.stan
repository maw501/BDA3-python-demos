data {
  int<lower=0> N_people;
  int<lower=0> N;
  int parent_smoke[N];
  int female[N];
  int t[N];
  int smoke[N];
  int<lower=1, upper=N_people> p_idx[N];
}

parameters {
  real b0;
  real b1;
  real b2;
  real b3;
  real b4;
  real<lower=0> sigma_alpha;
  vector[N_people] alpha_raw;
}

transformed parameters {
  vector[N] theta;
  vector[N_people] alpha;
  alpha = sigma_alpha * alpha_raw;
  
  for (i in 1:N) {
    theta[i] = alpha[p_idx[i]] + b0 + b1*parent_smoke[i] + b2 * female[i] + (t[i] * (1 - female[i])) * b3 + b4 * t[i] * female[i];
  }
  
}

model {
  // priors
  sigma_alpha ~ normal(0, 10);
  alpha_raw ~ std_normal();
  
  // likelihood
  for (i in 1:N) {
    smoke[i] ~ bernoulli_logit(theta[i]);
  }

}

generated quantities {
  int<lower=0, upper=1> y_pred[N];
  
  for (i in 1:N) {
    y_pred[i] = bernoulli_logit_rng(theta[i]);
  }
}