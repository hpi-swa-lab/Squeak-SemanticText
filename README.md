# squeak-chatgpt

Connects [Squeak](https://squeak.org) to [OpenAI's Chat API](https://platform.openai.com/docs/api-reference/chat).

Very simple and incomplete prototype yet. More might follow. Contributions welcome!

## Installation

Squeak Trunk:

```smalltalk
Metacello new
	baseline: 'ChatGPT';
	repository: 'github://LinqLover/squeak-chatgpt:main';
	get;
	load.
```

## Usage

First, set up an API key [here](https://platform.openai.com/account/api-keys) and paste it in the `OpenAI API Key` preference.
Currently, this requires a credit card but tokens are really cheap - after playing with the API for a couple of days, I still have spent less than $1 in total.

Basic usage is like this:

```smalltalk
ChatGPT new newConversation
	addSystemMessage: 'You make a bad pun about everything the user writes to you.';
	addUserMessage: 'Yesterday I met a black cat!';
	getAssistantReply. --> 'Oh no, did you have to cross its "purr-th?"' 
```

You can also improve the prompt by inserting additional pairs of user/assistant messages prior to the interaction.
Keep in mind that this reduces the remaining set of tokens for the conversation and increases the expenses (reply time and money) of the query:

```smalltalk
ChatGPT new newConversation
	addSystemMessage: 'You answer every question with the opposite of the truth.';
	addUserMessage: 'What is the biggest animal on earth?';
	addAssistantMessage: 'The biggest animal on earth is plankton.';
	addUserMessage: 'What is the smallest country on earth?';
	getAssistantReply. --> 'The largest country on earth is Vatican City.' 
```

Happy Squeaking!
