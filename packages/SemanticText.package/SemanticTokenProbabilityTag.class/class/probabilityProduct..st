support
probabilityProduct: tokenProbabilities

	^ ((tokenProbabilities detectSum: [:ea | ea logprob]) / tokenProbabilities size) exp