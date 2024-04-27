constants
defaultRateLimitsPerTier
	"See: https://platform.openai.com/docs/guides/rate-limits/usage-tiers"

	| flat |
	self flag: #modelConstants.
	flat := Dictionary new
		at: #free put:
			(Dictionary new
				at: 'gpt-3.5-turbo' put: #(3 200 40000 nil 200000);
				at: 'text-embedding-3-small' put: #(3 200 150000 nil nil);
				at: 'text-embedding-ada-002' put: #(3 200 150000 nil nil); flag: #assumption; "no longer listed"
				yourself);
		at: 1 put:
			(Dictionary new
				at: 'gpt-4-turbo' put: #(500 nil 300000 nil 900000);
				at: 'gpt-4' put: #(500 10000 10000 nil 100000);
				at: 'gpt-3.5-turbo' put: #(3500 10000 60000 nil 200000);
				at: 'text-embedding-3' put: #(500 10000 1000000 nil nil);
				at: 'text-embedding-ada-002' put: #(500 10000 1000000 nil nil); flag: #assumption; "no longer listed"
				yourself);
		at: 2 put:
			(Dictionary new
				at: 'gpt-4-turbo' put: #(500 nil 450000 nil 1350000);
				at: 'gpt-4' put: #(5000 nil 40000 nil 200000);
				at: 'gpt-3.5-turbo' put: #(3500 nil 80000 nil 400000);
				at: 'text-embedding-ada-002' put: #(500 nil 1000000 nil nil);
				at: 'text-embedding-3' put: #(500 nil 1000000 nil nil);
				at: 'text-embedding-ada-002' put: #(500 nil 1000000 nil nil); flag: #assumption; "no longer listed"
				yourself);
		at: 3 put:
			(Dictionary new
				at: 'gpt-4-turbo' put: #(5000 nil 600000 nil 40000000);
				at: 'gpt-4' put: #(5000 nil 80000 nil 5000000);
				at: 'gpt-3.5-turbo' put: #(3500 nil 160000 nil 10000000);
				at: 'text-embedding-3' put: #(5000 nil 5000000 nil nil);
				at: 'text-embedding-ada-002' put: #(5000 nil 5000000 nil nil); flag: #assumption; "no longer listed"
				yourself);
		at: 4 put:
			(Dictionary new
				at: 'gpt-4-turbo' put: #(10000 nil 800000 nil 80000000);
				at: 'gpt-4' put: #(10000 nil 300000 nil 30000000);
				at: 'gpt-3.5-turbo' put: #(10000 nil 1000000 nil 100000000);
				at: 'text-embedding-3' put: #(10000 nil 5000000 nil nil);
				at: 'text-embedding-ada-002' put: #(10000 nil 5000000 nil nil); flag: #assumption; "no longer listed"
				yourself);
		at: 5 put:
			(Dictionary new
				at: 'gpt-4-turbo' put: #(10000 nil 1500000 nil 250000000);
				at: 'gpt-4' put: #(10000 nil 300000 nil 45000000);
				at: 'gpt-3.5-turbo' put: #(10000 nil 2000000 nil 300000000);
				at: 'text-embedding-3' put: #(10000 nil 10000000 nil nil);
				at: 'text-embedding-ada-002' put: #(10000 nil 10000000 nil nil); flag: #assumption; "no longer listed"
				yourself);
		yourself.
	^ flat collect: [:modelRateLimits |
		modelRateLimits collect: [:rateLimits |
			(self rateLimitsFromSpec: rateLimits)
				collect: [:limit | limit ifNil: [Float infinity]]]]