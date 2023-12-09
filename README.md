# Squeak-SemanticText

> ChatGPT, embedding search, and retrieval-augmented generation for Squeak/Smalltalk

*Semantics* (from ancient Greek *sēmantikós*) refers to the significance or meaning of information. While the normal `String` and `Text` classes in Squeak take a syntactic view on text as a sequence of characters and formatting instructions, `SemanticText` focuses on the sense and understanding of text. With the advent of NLP (natural language processing) and LMMs (large language models), the availability of text interpretability in computing systems is expanding substantially. This package aims to make semantic context accessible in [Squeak/Smalltalk](https://squeak.org) by providing the following features:

- **[OpenAI API](https://platform.openai.com/docs/api-reference) client:** Currently supports chat completions and embeddings. Includes tools for managing rate limits, tracking expenses, and estimating prices for queries.
- **SemanticConversation:** Framework for conversational agents like ChatGPT.
- **ChatGPT:** Conversational GUI for Squeak. Supports streaming responses, editing conversations, and defining system messages.
- **SemanticCorpus:** Framework for semantic search, similarity search, and retrieval-augmented generation (RAG, aka "chat with your data") through the power of text embeddings. Implements a simple yet functional vector database.
- **Experimental tools** such as an integration of semantic search and RAG into Squeak's Help Browser or Squeak's mailing list.

For more details, install the package and dive into the class comments, or read below.

<table>
  <tr>
    <td width="35%">
	  <p>
	    <strong><a href="#conversations-and-chatgpt">ChatGPT</a></strong>
        <img alt="ChatGPT: System: Why Squeak/Smalltalk is the best programming environment in the world (in 5 sentences) / Assistant: 1. Squeak/Smalltalk provides a dynamic and live programming environment that allows developers to write, debug, and even change code while the program is still running, which enhances productivity. / 2. Its purified object-oriented nature enhances readability and maintainability, enabling novices to learn programming concepts easily. / 3. Squeak/Smalltalk is portable and comes bundled with a rich collection of libraries and tools, allowing development on various platforms. / 4. It enables interactive programming through a graphical user interface, which is ideal for writing scalable and complex applications. / 5. Lastly, Squeak/Smalltalk values simplicity and uniformity in its syntax and semantics, which reduces the cognitive load of developers, allowing more focus on problem-solving. /User: " src="./assets/ChatGPT.png" />
	  </p>
	  <p>
	    <strong><a href="#openai-api-expense-watcher">OpenAI API Expense Watcher</a></strong>
		<img alt="OpenAI API Expense Watcher: self totalExpense of an OpenAIAccount: ¢2.92 + approx ¢24.8" src="./assets/expenseWatcher.png" />
	  </p>
	  <p>
	    <strong><a href="#editor-integration">Editor Integration: Explain It / Summarize It</a></strong>
		<img alt="Context menu on text field with class comment for SemanticCorpus: explain it, summarize, ask question about it..." src="./assets/explainIt.png">
	  </p>
	</td>
	<td width="50%">
	  <p>
	    <strong><a href="#gui---experimental-help-browser-integration">Help Browser Integration:</a> Semantic Search and Retrieval Augmented Generation (RAG)</strong>
        <img alt="Help Browser Integration: Semantic Search and Retrieval Augmented Generation (RAG). System reference for ProtoObject: Search Results > 'store floats in a file'. Smart reply (experimental, powered by AI): To store floats in a file in Squeak/Smalltalk, you can use the DataStream class. Here is an example of how to use it: / 1. Create a DataStream object and specify the file name: `stream := DataStream fileNamed: 'floats.dat'.` / 2. Write the floats to the stream:    `stream nextPut: 3.14.` `stream nextPut: 2.71828.` `stream nextPut: 1.41421356.` / 3. Close the stream: `stream close.` / To read the floats back from the file, you can use the same DataStream object: ..." src="./assets/HelpSystemSearch.png" />
	  </p>
	  <p>
	    <strong><a href="#squeak-inbox-talk-integration">Squeak Inbox Talk Integration:</a> Similar Conversation Search</strong>
	    <img alt="Squeak Inbox Talk Integration: Similar Conversation Search. [squeak-dev] Some questions and comments regarding notation of floats and scaled decimals. Similar conversations (powered by OpenAI embeddings) / Experimental. May be biased or ineffective. / Numerics question: reading floating point constants / RE: Float equality? (was: [BUG] Float NaN's) / Rounding floats / Decimals as fractions / Bug in Floats? / Float differences / Float precision / ..." src="./assets/SIT-similarConversations.png" />
	  </p>
	</td>
  </tr>
</table>

Very simple and incomplete prototype yet. More might follow. Feedback and contributions welcome!

## Installation

Get a [current Squeak Trunk image](https://squeak.org/downloads/) and do this in a workspace:

```smalltalk
Metacello new
	baseline: 'SemanticText';
	repository: 'github://LinqLover/Squeak-SemanticText:main';
	get; "for updates"
	load.
```

As most functionality is currently based on the OpenAI API, you need to set up an API key [here](https://platform.openai.com/account/api-keys) and paste it in the `OpenAI API Key` preference.
If you register an account at OpenAI, you will receive a free budget of $5 for the first three months. This is enough for chatting more than 1 mio. words or embedding 50 mio. words (or 42 times the collected works of Shakespeare). However, if you want to make more or more frequent accesses to the API, you will need to provide a credit card. Nonetheless, tokens are really cheap - after playing with the API for a couple of weeks, I still have spent less than $10 in total.

## Usage

### Conversations and ChatGPT

#### GUI

From the world main docking bar, go to <kbd>Apps</kbd> > <kbd>ChatGPT</kbd>.

#### API

Basic usage is like this:

```smalltalk
SemanticConversation new
	addSystemMessage: 'You make a bad pun about everything the user writes to you.';
	addUserMessage: 'Yesterday I met a black cat!';
	getAssistantReply. --> 'Oh no, did you have to cross its "purr-th?"' 
```

You can also improve the prompt by inserting additional pairs of user/assistant messages prior to the interaction.
Keep in mind that this reduces the remaining set of tokens for the conversation and increases the expenses (reply time and money) of the query:

```smalltalk
SemanticConversation new
	addSystemMessage: 'You answer every question with the opposite of the truth.';
	addUserMessage: 'What is the biggest animal on earth?';
	addAssistantMessage: 'The biggest animal on earth is plankton.';
	addUserMessage: 'What is the smallest country on earth?';
	getAssistantReply. --> 'The largest country on earth is Vatican City.' 
```

### Semantic and similary search

#### GUI - Experimental Help Browser integration

Open a Help Browser from the world main docking bar and type in your query into search field. Note that at the moment, synonymous search terms work better than questions (e.g., prefer "internet connection" over "how can I access the internet?").

#### API

Everything starts at the class `SemanticCorpus`. For example, this is how you could set up a semantic search corpus for Squeak's Help System yourself:

```smalltalk
"Set up and populate semantic corpus"
helpTopics := CustomHelp asHelpTopic semanticDeepSubtopicsSkip: [:topic |
	topic title = 'All message categories']. "not relevant"
corpus := SemanticPluggableCorpus titleBlock: #title contentBlock: #contents.
corpus addFragmentDocumentsFromAll: helpTopics.
corpus estimatePriceToInitializeEmbeddings. --> approx ¢1.66
corpus updateEmbeddings.

"Similarity search"
originTopic := helpTopics detect: [:ea | ea key = #firstContribution].
results := corpus findObjects: 10 similarToObject: originTopic.

"Semantic search"
results := corpus findObjects: 10 similarToQuery: 'internet connection'.
"Optionally, display results in a HelpBrowser"
resultsTopic := HelpTopic named: 'Search results'.
results do: [:ea | resultsTopic addSubtopic: ea].
resultsTopic browse.

"RAG"
(corpus newConversationForQuery: 'internet connection') open.
```

### Editor Integration

Yellow-click on any text editor (optionally select a portion of text before that), click <kbd>more...</kbd>, and select one of <kbd>explain it</kbd>, <kbd>summarize it</kbd>, and <kbd>ask question about it...</kbd>. Or shortly via keyboard: <kbd>Esc</kbd>, <kbd>🔼</kbd>, <kbd>Enter</kbd>, <kbd>q</kbd>. 🤓

### Squeak Inbox Talk Integration

Get [Squeak Inbox Talk](https://github.com/hpi-swa-lab/squeak-inbox-talk) (world main docking bar > <kbd>Tools</kbd> > <kbd>Squeak Inbox Talk</kbd>), update it to the latest version through the <kbd>Settings</kbd> menu, and turn on the option <kbd>Semantic search in Squeak Inbox Talk</kbd> in the preferences browser.

### OpenAI API Expense Watcher

Do this:

```smalltalk
OpenAIAccount openExpenseWatcher
```

## Acknowledgments

Thanks to Vincent Eichhorn ([@vincenteichhorn](https://github.com/vincenteichhorn)) for giving me an overview of indexing techniques for Vector DBs (will implement one soon!).
Thanks to Toni Mattis ([@amintos](https://github.com/amintos)) for tips regarding embedding search (in particular for [`541ae49`](https://github.com/LinqLover/Squeak-SemanticText/commit/541ae49a76ee5ef80130a77017f0ed24aa65c897)).
Thanks to [r/MachineLearning](https://www.reddit.com/r/MachineLearning/comments/14pgogs/d_best_embedding_models_for_retrieving_mixed/?utm_source=share&utm_medium=web2x&context=3) folks for suggesting alternative embedding models (your suggestions will maybe implemented one day).

---

Happy Squeaking!
