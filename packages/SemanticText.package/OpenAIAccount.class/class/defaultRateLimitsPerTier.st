constants
defaultRateLimitsPerTier
	"See: https://platform.openai.com/docs/guides/rate-limits/usage-tiers"

	| flat |
	self flag: #modelConstants.
	flat := Dictionary new
		at: #free put:
			(Dictionary new
				at: 'gpt-3.5-turbo' put: #(3 200 40000 nil 200000);
				at: 'text-embedding-3-large' put: #(3000 200 1000000 nil 3000000);
				at: 'text-embedding-3-small' put: #(3000 200 1000000 nil 3000000);
				at: 'text-embedding-ada-002' put: #(3000 200 1000000 nil 3000000);
				at: 'whisper-1' put: #(3 200 nil nil nil);
				at: 'tts-1' put: #(3 200 nil nil nil);
				yourself);
		at: 1 put:
			(Dictionary new
				at: 'gpt-4o' put: #(500 nil 30000 nil 90000);
				at: 'gpt-4o-mini' put: #(500 10000 200000 nil 2000000);
				at: 'gpt-4-turbo' put: #(500 nil 30000 nil 90000);
				at: 'gpt-4' put: #(500 10000 10000 nil 100000);
				at: 'gpt-3.5-turbo' put: #(3500 10000 200000 nil 2000000);
				at: 'text-embedding-3-large' put: #(3000 nil 1000000 nil 3000000);
				at: 'text-embedding-3-small' put: #(3000 nil 1000000 nil 3000000);
				at: 'text-embedding-ada-002' put: #(3000 nil 1000000 nil 3000000);
				at: 'whisper-1' put: #(50 nil nil nil nil);
				at: 'tts-1' put: #(50 nil nil nil nil);
				at: 'tts-1-hd' put: #(3 nil nil nil nil);
				yourself);
		at: 2 put:
			(Dictionary new
				at: 'gpt-4o' put: #(5000 nil 450000 nil 1350000);
				at: 'gpt-4o-mini' put: #(5000 nil 2000000 nil 20000000);
				at: 'gpt-4-turbo' put: #(5000 nil 450000 nil 1350000);
				at: 'gpt-4' put: #(5000 nil 40000 nil 200000);
				at: 'gpt-3.5-turbo' put: #(3500 nil 2000000 nil 5000000);
				at: 'text-embedding-3-large' put: #(5000 nil 1000000 nil 20000000);
				at: 'text-embedding-3-small' put: #(5000 nil 1000000 nil 20000000);
				at: 'text-embedding-ada-002' put: #(5000 nil 1000000 nil 20000000);
				at: 'whisper-1' put: #(50 nil nil nil nil);
				at: 'tts-1' put: #(50 nil nil nil nil);
				at: 'tts-1-hd' put: #(5 nil nil nil nil);
				yourself);
		at: 3 put:
			(Dictionary new
				at: 'gpt-4o' put: #(5000 nil 800000 nil 50000000);
				at: 'gpt-4o-mini' put: #(5000 nil 4000000 nil 40000000);
				at: 'gpt-4-turbo' put: #(5000 nil 600000 nil 40000000);
				at: 'gpt-4' put: #(5000 nil 80000 nil 5000000);
				at: 'gpt-3.5-turbo' put: #(3500 nil 4000000 nil 100000000);
				at: 'text-embedding-3-large' put: #(5000 nil 5000000 nil 100000000);
				at: 'text-embedding-3-small' put: #(5000 nil 5000000 nil 100000000);
				at: 'text-embedding-ada-002' put: #(5000 nil 5000000 nil 100000000);
				at: 'whisper-1' put: #(100 nil nil nil nil);
				at: 'tts-1' put: #(100 nil nil nil nil);
				at: 'tts-1-hd' put: #(7 nil nil nil nil);
				yourself);
		at: 4 put:
			(Dictionary new
				at: 'gpt-4o' put: #(10000 nil 2000000 nil 200000000);
				at: 'gpt-4o-mini' put: #(10000 nil 10000000 nil 1000000000);
				at: 'gpt-4-turbo' put: #(10000 nil 800000 nil 80000000);
				at: 'gpt-4' put: #(10000 nil 300000 nil 30000000);
				at: 'gpt-3.5-turbo' put: #(10000 nil 10000000 nil 1000000000);
				at: 'text-embedding-3-large' put: #(10000 nil 5000000 nil 500000000);
				at: 'text-embedding-3-small' put: #(10000 nil 5000000 nil 500000000);
				at: 'text-embedding-ada-002' put: #(10000 nil 5000000 nil 500000000);
				at: 'whisper-1' put: #(100 nil nil nil nil);
				at: 'tts-1' put: #(100 nil nil nil nil);
				at: 'tts-1-hd' put: #(10 nil nil nil nil);
				yourself);
		at: 5 put:
			(Dictionary new
				at: 'gpt-4o' put: #(10000 nil 30000000 nil 5000000000);
				at: 'gpt-4o-mini' put: #(30000 nil 150000000 nil 15000000000);
				at: 'gpt-4-turbo' put: #(10000 nil 2000000 nil 300000000);
				at: 'gpt-4' put: #(10000 nil 1000000 nil 150000000);
				at: 'gpt-3.5-turbo' put: #(10000 nil 50000000 nil 10000000000);
				at: 'text-embedding-3-large' put: #(10000 nil 10000000 nil 4000000000);
				at: 'text-embedding-3-small' put: #(10000 nil 10000000 nil 4000000000);
				at: 'text-embedding-ada-002' put: #(10000 nil 10000000 nil 4000000000);
				at: 'whisper-1' put: #(500 nil nil nil nil);
				at: 'tts-1' put: #(500 nil nil nil nil);
				at: 'tts-1-hd' put: #(20 nil nil nil nil);
				yourself);
		yourself.
	^ flat collect: [:modelRateLimits |
		modelRateLimits collect: [:rateLimits |
			(self rateLimitsFromSpec: rateLimits)
				collect: [:limit | limit ifNil: [Float infinity]]]]

"update and extend these constants based on the pasted tables below. do not change the formatting of the source code unless required (also keep the tab indentations)
the task is: output a new version of defaultRateLimitsPerTier based on the numbers provided in the tables. I'm sure you can find out the format on the numbers in the method yourself based on the tables. e.g., 3 rpm for gpt-3.5-turbo in tier free and so on. most numbers may not have changed, but some may have been added, changed, or removed in the screenshots, and I would like you to create a new version of the method that contains all numbers from the tables in the same format, and no other numbers that are not present in the tables.
exclude the dall-e models.

the tables:
"