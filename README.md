# Bayesian Data Analysis 3rd Edition: Python demos

Demos based on [Aki Vehtari's repo](https://github.com/avehtari/BDA_py_demos) with Python demos for the book [Bayesian Data
Analysis, 3rd edition by Gelman, Carlin, Stern, Dunson, Vehtari, and Rubin (BDA3)](http://www.stat.columbia.edu/~gelman/book/). Aki also has a course, the repo is here: [Bayesian Data Analysis course material](https://github.com/avehtari/BDA_course_Aalto).

## Overview

As well as the original notebooks, this repository is where I plan to store other examples from the book as I work through/encounter them.

Notebooks named in the format `demoX_Y.ipynb` are based on the original notebooks from Aki's repo (where `X` is the chapter number, `Y` the notebook number) - the other ones are mine.

The main changes vs. the original repository for now are relatively minor ones I have made for pedagogical reasons, either to make things clearer to myself or to tidy up certain parts of some notebooks (though not entirely). 

## Contents

Currently there are demos for BDA3 Chapters 2, 3, 4, 5, 6, 9, 10 and 11. A summary of and link to each notebook is provided below.



**Chapter 2: Single-parameter models**

All notebooks relate to the example in BDA3 on p. 37. 

* [`demo2_1.ipynb`](demos_ch2/demo2_1.ipynb): plot posterior distribution for example.
* [`demo2_2.ipynb`](demos_ch2/demo2_2.ipynb): plot posterior distribution with a different prior.
* [`demo2_3.ipynb`](demos_ch2/demo2_3.ipynb): plot samples from posterior as per Fig 2.3 in BDA3.
* [`demo2_4.ipynb`](demos_ch2/demo2_4.ipynb): calculate posterior for a non-conjugate prior over a grid.


**Chapter 3: Intro. to multiparameter models**

* [`demo3_1-4.ipynb`](demos_ch3/demo3_1-4.ipynb): examples and illustrations for a normal model with unknown mean and variance (BDA3 section 3.2 on p. 64).
* [`demo3_5.ipynb`](demos_ch3/demo3_5.ipynb): demonstrate a normal model for the Newcomb's data (BDA3 p. 66).
* [`demo3_6.ipynb`](demos_ch3/demo3_6.ipynb): illustrate posterior inference for Bioassay data (BDA3 p. 74-).


**Chapter 4: Asymptotics and connections to non-Bayesian approaches**

* [`demo4_1.ipynb`](demos_ch4/demo4_1.ipynb): normal approximation for Bioassay model.


**Chapter 5: Hierarchical models**

* [`demo5_1.ipynb`](demos_ch5/demo5_1.ipynb): hierarchical model for Rats experiment (BDA3 p. 102).
* [`demo5_2.ipynb`](demos_ch5/demo5_2.ipynb): hierarchical model for SAT-example data (BDA3 p. 115 and discussion in section 5.5).


**Chapter 6: Model checking**

* [`demo6_1.ipynb`](demos_ch6/demo6_1.ipynb): posterior predictive checking demo for light speed (BDA3 p. 143).
* [`demo6_2.ipynb`](demos_ch6/demo6_2.ipynb): posterior predictive checking - testing for autocorrelation in binomial data using Bayesian p-values and test quantities.
* [`demo6_3.ipynb`](demos_ch6/demo6_3.ipynb): posterior predictive checking demo for the light speed example (BDA3 p. 146) with a poorly chosen metric.
* [`demo6_4.ipynb`](demos_ch6/demo6_4.ipynb): posterior predictive checking demo using marginal predictive checks (BDA3 p. 152-153).
* [`p-values.ipynb`](demos_ch6/p-values.ipynb): analysis of the distribution of the Bayesian p-value (BDA3 p. 151).


**Chapter 9: Decision analysis**

* [`demo9_1.ipynb`](demos_ch9/demo9_1.ipynb): decision analysis example (stand-alone): guess how many coins there are in the jar.


**Chapter 10: Intro. to Bayesian computation**

* [`demo10_1.ipynb`](demos_ch10/demo10_1.ipynb): rejection sampling example.
* [`demo10_2.ipynb`](demos_ch10/demo10_2.ipynb): importance sampling example.
* [`demo10_3.ipynb`](demos_ch10/demo10_3.ipynb): importance sampling with Normal distribution as a proposal for Bioassay model.


**Chapter 11: Basics of Markov chain simulation**

* [`demo11_1.ipynb`](demos_ch11/demo11_1.ipynb): Gibbs sampling demonstration.
* [`demo11_2.ipynb`](demos_ch11/demo11_2.ipynb): Metropolis sampling demonstration.
