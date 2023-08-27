private - fragments
split: contentString title: titleString do: chunkBlock maxRecursion: maxRecursion
	"Based on split_strings_from_subsection() from the OpenAI Cookbook: https://github.com/openai/openai-cookbook/blob/4912564dc16745c9376e2b1f78c80cb1bab73f01/examples/Embedding_Wikipedia_articles_for_search.ipynb"

	| fullString |
	fullString := titleString , String cr, String cr , contentString.
	(self embeddingModel countTokensIn: fullString) <= self maxTokens ifTrue: [
		contentString ifNotEmpty: [
			chunkBlock value: 1 value: contentString size].
		^ self].
	
	maxRecursion > 0 ifTrue: [
		| delimiters |
		delimiters := {String cr, String cr. String cr. '. '}.
		delimiters
			detect: [:delimiter |
				self trySplitString: contentString by: delimiter halvesDo: [:half |
					self split: half title: titleString do: chunkBlock maxRecursion: maxRecursion - 1]]
			ifFound: [:delimiter | ^ self]].
	
	fullString := (self embeddingModel truncateString: fullString to: self maxTokens) talkWithoutLeading: titleString caseSensitive: true.
	fullString ifNotEmpty: [
		chunkBlock value: 1 value: fullString size - (titleString size + 2 "crs")].