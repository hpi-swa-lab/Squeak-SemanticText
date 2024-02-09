constants
defaultRateLimitsPerTier
	"See: https://platform.openai.com/docs/guides/rate-limits/usage-tiers"

	| flat |
	self flag: #modelConstants.
	flat := Dictionary new
		at: #free put:
			(Dictionary new
				at: 'gpt-3.5-turbo' put: #(3 200 40000 nil);
				at: 'text-embedding-ada-002' put: #(3 200 150000 nil);
				at: 'text-embedding-3' put: #(3 200 150000 nil); flag: #assumption; "https://community.openai.com/t/rate-limits-for-new-embedding-v3-models/618110"
				yourself);
		at: 1 put:
			(Dictionary new
				at: 'gpt-4' put: #(500 10000 10000 nil);
				at: 'gpt-4-turbo-preview' put: #(500 10000 150000 500000);
				at: 'gpt-3.5-turbo' put: #(3500 10000 60000 nil);
				at: 'text-embedding-ada-002' put: #(500 10000 1000000 nil);
				at: 'text-embedding-3' put: #(500 10000 1000000 nil); flag: #assumption; "https://community.openai.com/t/rate-limits-for-new-embedding-v3-models/618110"
				yourself);
		at: 2 put:
			(Dictionary new
				at: 'gpt-4' put: #(5000 nil 40000 nil);
				at: 'gpt-4-turbo-preview' put: #(500 nil 300000 1500000);
				at: 'gpt-3.5-turbo' put: #(3500 nil 80000 nil);
				at: 'text-embedding-ada-002' put: #(500 nil 1000000 nil);
				at: 'text-embedding-3' put: #(500 nil 1000000 nil); flag: #assumption; "https://community.openai.com/t/rate-limits-for-new-embedding-v3-models/618110"
				yourself);
		at: 3 put:
			(Dictionary new
				at: 'gpt-4' put: #(5000 nil 80000 nil);
				at: 'gpt-4-turbo-preview' put: #(5000 nil 300000 5000000);
				at: 'gpt-3.5-turbo' put: #(3500 nil 160000 nil);
				at: 'text-embedding-ada-002' put: #(5000 nil 5000000 nil);
				at: 'text-embedding-3' put: #(5000 nil 5000000 nil); flag: #assumption; "https://community.openai.com/t/rate-limits-for-new-embedding-v3-models/618110"
				yourself);
		at: 4 put:
			(Dictionary new
				at: 'gpt-4' put: #(10000 nil 300000 nil);
				at: 'gpt-4-turbo-preview' put: #(10000 nil 450000 nil);
				at: 'gpt-3.5-turbo' put: #(10000 nil 1000000 nil);
				at: 'text-embedding-ada-002' put: #(10000 nil 5000000 nil);
				at: 'text-embedding-3' put: #(10000 nil 5000000 nil); flag: #assumption; "https://community.openai.com/t/rate-limits-for-new-embedding-v3-models/618110"
				yourself);
		at: 5 put:
			(Dictionary new
				at: 'gpt-4' put: #(10000 nil 300000 nil);
				at: 'gpt-4-turbo-preview' put: #(10000 nil 600000 nil);
				at: 'gpt-3.5-turbo' put: #(10000 nil 2000000 nil);
				at: 'text-embedding-ada-002' put: #(10000 nil 10000000 nil);
				at: 'text-embedding-3' put: #(10000 nil 10000000 nil); flag: #assumption; "https://community.openai.com/t/rate-limits-for-new-embedding-v3-models/618110"
				yourself);
		yourself.
	^ flat collect: [:modelRateLimits |
		modelRateLimits collect: [:rateLimits |
			(self rateLimitsFromSpec: rateLimits)
				collect: [:limit | limit ifNil: [Float infinity]]]]