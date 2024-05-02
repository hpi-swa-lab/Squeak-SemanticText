private
makeCalcPatterns

	"1) Define terminals"
	| brackets functions operations terminals |
	terminals := OrderedDictionary new.
	terminals at: #number put:
		'(
			(?<! (\d | \)) \s*)
			-
		)?
		(
		# c-style int/float
			(
				\d+ ( \. \d* )?
			|
				\. \d+
			)
			( e \d+ )?
		|
		# serialized Smalltalk fraction
			\[ \d+ \: \d+ \]
		)'.
	
	"2) Define functions, brackets, and operations"
	functions := {'
		(?<name>\\p\{L\}+)
		\\(
		\\s*
		(?<number>{number})
		(
			\\s*
			,
			\\s*
			(?<number>{number})
		)*
		\\s*
		\\)'
			-> [:match :matches |
				| name numbers |
				name := match value: #name.
				numbers := (matches value: #number) collect: [:ea | self parseNumber: ea].
				numbers first perform: name asSymbol withArguments: numbers allButFirst]}.
	brackets := {'
		\\(
		\\s*
		(?<number>{number})
		\\s*
		\\)'
			-> [:match |
				| number |
				number := self parseNumber: (match value: #number).
				number]}.
	operations := {{'^' -> #**}. '*/'. '+-'} collect: [:operatorSpecs |
		| operators pattern |
		operators := String withAll: (operatorSpecs collect: [:spec |
			spec isVariableBinding ifTrue: [spec key] ifFalse: [spec]]).
		pattern := '
			(?<left>{number})
			\\s*
			(?<operator>[{operators}])
			\\s*
			(?<right>{number})'.
		{pattern. #operators -> (operators copyWithRegex: '(?=.)' matchesReplacedWith: '\')} -> [:match |
			| left right operator stOperator |
			left := self parseNumber: (match value: #left).
			right := self parseNumber: (match value: #right).
			operator := match value: #operator.
			stOperator := operatorSpecs
				detect: [:spec | spec isVariableBinding and: [spec key = operator]]
				ifFound: [:spec | operator := spec value]
				ifNone: [operator asSymbol].
			left perform: stOperator with: right]].
	
	"3) Compile patterns"
	^ ((({functions. brackets. operations} collect: [:patternSpecs | patternSpecs as: OrderedDictionary]) fold: #,)
		associations collect: [:patternSpec |
			| pattern patternArgs handler |
			pattern := patternSpec key.
			patternArgs := terminals collect: [:terminal | '({1})' format: {terminal}].
			pattern isString ifFalse:
				[pattern := pattern first.
				patternArgs := patternArgs , (patternSpec key allButFirst as: Dictionary)].
			handler := patternSpec value.
			
			(pattern format: patternArgs)
				-> [:matcher |
					handler
						cull: [:name | matcher keyedSubexpression: name]
						cull: [:name | matcher keyedSubexpressions: name]]])
			as: OrderedDictionary