#!/usr/bin/env python3
'''
@Author: King
@Date: 2023-02-17 17:42:30
@Email: linsy_king@sjtu.edu.cn
'''

# Get word frequency list

import pandas
import pickle
import itertools
import scipy.stats
import random
from jmutils.common.common import standardize
# from jmutils.Topsis.Topsis import topsis
from topsis import topsis
from wordle import calculate_entropies, calculate_pattern

DICT_FILE_all = 'words.txt'
MODEL_SET = 'part_dict.p'

# DICT_FILE_all = 'all_words.txt'
# MODEL_SET = 'all_dict.p'

class PlayerModel:
    def __init__(self) -> None:
        '''
        Initialize a Player model
        '''
        # Get frequency dictionary
        df = pandas.read_csv('./word_freq.csv', header=None, index_col=0, squeeze = True)
        self.freq = df.to_dict()
        self.pattern_dict = pickle.load(open(MODEL_SET, 'rb'))
        self.gen_samples()

    def gen_samples(self):
        lower = 0
        upper = 1
        mu = 0.9
        sigma = 0.3
        self.N = 30
        self.samples = scipy.stats.truncnorm.rvs(
                (lower-mu)/sigma,(upper-mu)/sigma,loc=mu,scale=sigma,size=self.N)

    def run(self, word: str):
        for i in range(self.N):
            guess_num = self.get_dist_once(word, self.samples[i])
            print(guess_num)
            with open('result.txt', 'a') as f:
                f.write(f"{guess_num}\n")

    def dump_initial_entropy(self):
        with open(DICT_FILE_all) as ifp:
            all_dictionary = list(map(lambda x: x.strip(), ifp.readlines()))
        WORD_LEN = len(all_dictionary[0]) # 5-letters 
        # Generate the possible patterns of information we can get
        all_patterns = list(itertools.product([0, 1, 2], repeat=WORD_LEN))
        all_words = set(all_dictionary)
        candidates = all_dictionary
        entropies = calculate_entropies(candidates, all_words, self.pattern_dict, all_patterns)

        if max(entropies.values()) < 0.1:
            candidates = all_words
            entropies = calculate_entropies(candidates, all_words, self.pattern_dict, all_patterns)
        # options = entropies.items()
        options = sorted(entropies.items(), key=lambda x: x[1], reverse=True)
        for (opt, enp) in options:
            with open('entropy.csv', 'a') as f:
                f.write(f'{opt}, {enp}\n')


    def get_dist_once(self, word: str, alpha: float):
        WORD_TO_GUESS = word
        with open(DICT_FILE_all) as ifp:
            all_dictionary = list(map(lambda x: x.strip(), ifp.readlines()))
        WORD_LEN = len(all_dictionary[0]) # 5-letters 
        # Generate the possible patterns of information we can get
        all_patterns = list(itertools.product([0, 1, 2], repeat=WORD_LEN))
        all_words = set(all_dictionary)
        for n_round in range(0, 7):
            candidates = all_dictionary
            entropies = calculate_entropies(candidates, all_words, self.pattern_dict, all_patterns)

            if max(entropies.values()) < 0.1:
                candidates = all_words
                entropies = calculate_entropies(candidates, all_words, self.pattern_dict, all_patterns)

            # Guess the candiate with highest entropy
            guess_word = max(entropies.items(), key=lambda x: x[1])[0]
            # options = entropies.items()
            options = sorted(entropies.items(), key=lambda x: x[1], reverse=True)

            word_len = len(options)
            option_with_frequency = []
            for (opt, enp) in options:
                freq = 0
                if opt in self.freq:
                    freq = self.freq[opt]
                option_with_frequency.append([enp, freq])
            tp = topsis(option_with_frequency, [0.9+alpha/10, 0.1-alpha/10], [1,1])
            tp.calc()
            
            rand_idx = random.randint(1, word_len)
            opt_choice = tp.C.argsort()[-rand_idx]
            
            guess_word = options[opt_choice][0]
            # print(guess_word)
            # return
            if guess_word == WORD_TO_GUESS:
                return n_round + 1
            info = calculate_pattern(guess_word, WORD_TO_GUESS)
            words = self.pattern_dict[guess_word][info]
            all_words = all_words.intersection(words)

if __name__ == '__main__':
    model = PlayerModel()
    # model.run('third')
    model.dump_initial_entropy()
