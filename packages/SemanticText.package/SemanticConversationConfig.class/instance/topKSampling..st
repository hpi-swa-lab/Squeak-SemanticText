accessing
topKSampling: aNumber
	"Only available for Anthropic models. Only sample from the top K options for each subsequent token. Used to remove ""long tail"" low probability responses. Learn more technical details here: https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277. Recommended for advanced use cases only. You usually only need to use temperature. Required range: aNumber > 0"

	self argumentAt: #topKSampling put: aNumber.