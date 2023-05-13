#!/usr/bin/env python3
'''
@Author: King
@Date: 2023-02-18 19:33:06
@Email: linsy_king@sjtu.edu.cn
'''

'''
Load model
'''




import torch
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
class WordleModel:
    def __init__(self) -> None:
        doc = pd.read_csv('../All_Word.csv')
        cdoc = pd.read_csv('../C_Data.csv')
        self.dict = doc.set_index('word').to_dict('index')
        self.cdict = cdoc.set_index('Word').to_dict('index')
        self.net = torch.load('./fullmodel2.pt')

    def vowel(self, word: str):
        count = 0
        for c in word:
            if c in ['a', 'e', 'i', 'o', 'u']:
                count += 1
        return count

    def overlay(self, word: str):
        count = [0 for _ in range(26)]
        for c in word:
            count[ord(c) - 97] += 1
        return max(count) - 1

    def predict(self, word: str, ratio: float):
        y1 = self.dict[word]['y1']
        y2 = self.dict[word]['y2']
        y3 = self.dict[word]['y3']

        k = torch.tensor([y1, y2, y3, ratio]).to('cuda')
        return self.net(k).cpu().detach().numpy()

    def normal_dist(self, x, mean, sd):
        prob_density = (np.pi*sd) * np.exp(-0.5*((x-mean)/sd)**2)
        return prob_density

    def result(self, word: str, ratio: float = 0):
        if word in self.cdict:
            ratio = self.cdict[word]['ratio']
            sample_d = [
                self.cdict[word]['t1'],
                self.cdict[word]['t2'],
                self.cdict[word]['t3'],
                self.cdict[word]['t4'],
                self.cdict[word]['t5'],
                self.cdict[word]['t6'],
                self.cdict[word]['t7'],
            ]
            print('sample', sample_d)
            mu = self.cdict[word]['mu']
            sigma = self.cdict[word]['sigma']
            dist = []
            for x in range(1, 8):
                dist.append(self.normal_dist(x, mu, sigma))

            npa = np.array(dist)
            plt.bar(np.array([1, 2, 3, 4, 5, 6, 7]), sample_d)
            print('calc_mu_sigma', npa/npa.sum()*100)
        res = self.predict(word, ratio)
        dist = []
        for x in range(1, 8):
            dist.append(self.normal_dist(x, res[0], res[1]))

        npa = np.array(dist)
        result = npa/npa.sum()*100
        plt.bar(np.array([1, 2, 3, 4, 5, 6, 7]), npa/npa.sum()*100)
        # result[1] /=1.56
        # result[2]/= 1.56
        # result[3]/= 0.955
        # result[4]/= 1.128
        # result[5]/=1.18
        # result[6]/=1.64
        print('model', result)
        return result.tolist()
