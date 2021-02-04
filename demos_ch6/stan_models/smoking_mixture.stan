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
  real gamma_0;
  real gamma_1;
  real gamma_2;
  real<lower=0> sigma_alpha;
  vector[N_people] alpha_raw;
}

transformed parameters {
  vector[N] theta;
  vector[N] theta_susc;
  vector[N_people] alpha;
  alpha = b0 + sigma_alpha * alpha_raw;
  
  for (i in 1:N) {
    theta_susc[i] = gamma_0 + gamma_1*parent_smoke[i] + gamma_2 * female[i];
  }
  for (i in 1:N) {
    theta[i] = alpha[p_idx[i]] + b1*parent_smoke[i] + b2 * female[i] + (t[i] * (1 - female[i])) * b3 + b4 * t[i] * female[i];
  }
  
}

model {
  //int smoker[N];
  
  // priors
  sigma_alpha ~ normal(0, 25);
  alpha_raw ~ std_normal();

  // likelihood
  for (i in 1:N) {
    //smoker[i] ~ bernoulli_logit(theta_susc[i]);
    smoke[i] ~ bernoulli(inv_logit(theta[i])*inv_logit(theta_susc[i]));
  }
}
