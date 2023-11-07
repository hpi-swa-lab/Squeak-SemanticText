pages
semanticTextIntroduction
	"This method was automatically generated. Edit it using:"
	"SemanticTextHelp edit: #semanticTextIntroduction"
	<generated>
	^(HelpTopic
		title: 'Introduction'
		contents: 
'SemanticText: ChatGPT, embedding search, and retrieval-augmented generation for Squeak

Semantics (from ancient Greek semantikós) refers to the significance or meaning of information. While the normal String and Text classes in Squeak take a syntactic view on text as a sequence of characters and formatting instructions, SemanticText focuses on the sense and understanding of text. This package aims to make semantic context accessible in Squeak by providing the following features:

OpenAI API client: Currently supports chat completions and embeddings. Includes tools for managing rate limits, tracking expenses, and estimating prices for queries.
SemanticConversation: Framework for conversational agents like ChatGPT.
ChatGPT: Conversational GUI for Squeak. Supports streaming responses, editing conversations, and defining system messages.
SemanticCorpus: Framework for semantic search, similarity search, and retrieval-augmented generation (RAG, aka "chat with your data") through the power of text embeddings. Implements a simple yet functional vector database.
Experimental tools such as an integration of semantic search and RAG into Squeak''s Help Browser or Squeak''s mailing list. Enable them in the preferences.

Learn more, report issues, or contribute at our GitHub repository: https://github.com/LinqLover/Squeak-SemanticText!
]style[(87 1 9 21 10 357 18 148 21 51 8 115 15 209 18 56 21 4 21 21 11 70 48)b,,i,,i,,Rcode:// OpenAIModel;b,,Rcode:// SemanticConversation class>>#example;b,,Rcode:// SemanticConversationEditor open;b,,Rcode:// SemanticCorpus class>>#exampleHelp;b,,b,,Rcode://
HelpBrowser open;,,Rcode://
SemanticTextHelp openDockingBarMenuThat: [:m | m contents = ''Tools''] filterItem: ''Squeak Inbox Talk'';,,Rcode://
PreferenceBrowser open searchPattern: ''semantic'';,,Rhttps://github.com/LinqLover/Squeak-SemanticText;!' readStream nextChunkText)
			key: #semanticTextIntroduction;
			shouldStyle: false;
			yourself