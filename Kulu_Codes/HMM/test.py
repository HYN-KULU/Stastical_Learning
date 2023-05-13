import numpy as np
from hmmlearn import hmm

states = ["box 1", "box 2", "box3"]
n_states = len(states)

observations = ["red", "white"]
model2 = hmm.CategoricalHMM(n_components=2)
X2 = np.array([[0], [1], [0], [1], [0], [0], [0], [1], [1], [0], [1], [1]])
model2.fit(X2)
print(f'Transmission Matrix Generated:\n{model2.transmat_.round(3)}\n\n'
      )
# f'Transmission Matrix Recovered:\n{model.transmat_.round(3)}\n\n'
