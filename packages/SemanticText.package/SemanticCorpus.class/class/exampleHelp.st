examples
exampleHelp
	"Perform semantic and similarity search over Squeak's built-in help. This is a reduced example. For a mature version, see SemanticHelpSearchTopic instead."

	| corpus helpTopics originTopic results |
	helpTopics := CustomHelp asHelpTopic semanticDeepSubtopicsSkip: [:topic |
		topic title = 'All message categories'].
	corpus := SemanticPluggableCorpus titleBlock: #title contentBlock: #contents.
	corpus addFragmentDocumentsFromAll: helpTopics.
	corpus updateEmbeddings.
	
	originTopic := helpTopics detect: [:ea | ea key = #firstContribution].
	results := corpus findObjects: 10 similarToObject: originTopic.
	
	results := corpus findObjects: 10 similarToQuery: 'internet connection'.
	
	"| resultsTopic |
	resultsTopic := HelpTopic named: 'Search results'.
	results do: [:ea | resultsTopic addSubtopic: ea].
	resultsTopic browse."
	
	(corpus newConversationForQuery: 'download a file in squeak') open.