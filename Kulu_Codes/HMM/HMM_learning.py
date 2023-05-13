import numpy as np
from hmmlearn import hmm
import math
states = ["box 1", "box 2", "box3"]
n_states = len(states)

observations = ["red", "white"]
n_observations = len(observations)
gen_model = hmm.CategoricalHMM(n_components=2, random_state=99)
X2 = np.array([[0], [1], [0], [1], [0], [0], [0], [1], [1], [0], [1], [1]])
gen_model.startprob_ = np.array([1.0, 0.0])
gen_model.transmat_ = np.array([[0.95, 0.05],
                                [0.1, 0.9]])
gen_model.emissionprob_ = \
    np.array([[1 / 6, 1 / 6, 1 / 6, 1 / 6, 1 / 6, 1 / 6],
              [1 / 10, 1 / 10, 1 / 10, 1 / 10, 1 / 10, 1 / 2]])
rolls, gen_states = gen_model.sample(30000)  # 前者为可观测的，后者为隐藏的
# print(rolls, gen_states)
gen_score = gen_model.score(rolls)
print(gen_score)

model = hmm.CategoricalHMM(
    # (RandomState or an int seed, optional) – A random number generator instance.
    n_components=2, random_state=1,
    init_params='se')
# init_params (string, optional) – The parameters that get updated during (params) or
# initialized before (init_params) the training.
# Can contain any combination of ‘s’ for startprob, ‘t’ for transmat, and ‘e’ for emissionprob.
# Defaults to all parameters.


# don't init transition, set it below
# we need to initialize with random transition matrix probabilities
# because the default is an even likelihood transition
# we know transitions are rare
model.fit(rolls)
print(f'Transmission Matrix Generated:\n{gen_model.transmat_.round(3)}\n\n'
      f'Transmission Matrix Recovered:\n{model.transmat_.round(3)}\n\n')
