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
  //real tau;
  vector[N_people] alpha_raw;
}

transformed parameters {
  real theta[N];
  real theta_susc[N];
  vector[N_people] alpha;

  alpha = b0 + sigma_alpha*alpha_raw;
  //alpha = b0 + square(tau) * alpha_raw;


  for (i in 1:N) {
    theta_susc[i] = gamma_0 + gamma_1 * parent_smoke[i] + gamma_2 * female[i];
    theta[i] = alpha[p_idx[i]] + b1 * parent_smoke[i] + b2 * female[i] + (t[i] * (1 - female[i])) * b3 + b4 * t[i] * female[i];
  }
}

model {
  // priors
  sigma_alpha ~ normal(0, 20);
  alpha_raw ~ std_normal();
  b0 ~ normal(0, 20);
  b1 ~ normal(0, 20);
  b2 ~ normal(0, 20);
  b3 ~ normal(0, 20);
  gamma_0 ~ normal(0, 20);
  gamma_1 ~ normal(0, 20);
  gamma_2 ~ normal(0, 20);
  

  // likelihood
  for (n in 1:N) {
    real lpmf = bernoulli_lpmf(smoke[n] | inv_logit(theta[n]));
    real prob_zero = 1 - inv_logit(theta_susc[n]);
    
    if (smoke[n] == 0) {
      // target += log_sum_exp(bernoulli_logit_lpmf(0 | theta_susc[n]), bernoulli_logit_lpmf(1 | theta_susc[n]) + lpmf);
      target += log_mix(prob_zero, 0, lpmf);
    } else {
      // target += bernoulli_logit_lpmf(1 | theta_susc[n]) + lpmf;
      target += log(1 - prob_zero) + lpmf;
    }
  }
}

generated quantities {
  int<lower=0, upper=1> susceptible[N];
  int y_pred[N] = rep_array(0, N);
  
  for (n in 1:N) {
    susceptible[n] = bernoulli_logit_rng(theta_susc[n]);
    if (susceptible[n] == 1) {
      y_pred[n] = bernoulli_logit_rng(theta[n]);
    }
  }
}
