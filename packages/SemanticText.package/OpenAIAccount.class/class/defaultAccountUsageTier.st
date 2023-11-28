preferences
defaultAccountUsageTier
	<preference: 'OpenAI API Account Usage Tier' categoryList: #(SemanticText OpenAI) description: 'Rate and usage limits depend on the usage tier of your account, which is assigned by based on the duration of your subscription and the magnitude of your payments. Must be #free or a positive integer. You can find your current tier here: https://platform.openai.com/account/limits' type: #String>

	^ (DefaultAccount ifNil: [^ nil]) usageTier printString