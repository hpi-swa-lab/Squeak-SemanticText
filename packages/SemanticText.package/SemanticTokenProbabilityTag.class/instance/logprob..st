accessing
logprob: aNumber
	"Token probabilities are commonly represented in logarithmic form to support efficient and precise multiplications (addition of logarithms is faster than multiplication of probs, and multiplication of probs quickly leads to underflows). See class-side #probabilityProduct:."

	logprob := aNumber.