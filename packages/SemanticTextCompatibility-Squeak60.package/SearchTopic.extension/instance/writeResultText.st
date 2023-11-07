*SemanticTextCompatibility-Squeak60-searching-pseudo-override
writeResultText
	"Extension point. Subclasses may override this, e.g., to customize the representation of results."

	results ifNil: [^ resultText].
	results do: [:topicToResult |
		topicToResult isString
			ifTrue: [resultText append: (
				(topicToResult, String cr) asText
					addAttribute: (TextColor color: (Color gray: 0.7));
					yourself)]
			ifFalse: [
				resultText append: (
					'\----- Matches found in ''{1}'' -----\\' withCRs translated asText
						addAttribute: (TextColor color: (Color gray: 0.7));
						format: {topicToResult key title}).
				topicToResult value do: [:entry |
					resultText append: (self printResultEntry: entry)] 
					]]