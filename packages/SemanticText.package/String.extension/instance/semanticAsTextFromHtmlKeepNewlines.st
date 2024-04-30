*SemanticText-Tools-Conversation-converting
semanticAsTextFromHtmlKeepNewlines
	"Answer a Text by interpreting the receiver as HTML. Don't ignore newlines."

	^ (HtmlReadWriter on: self readStream)
		breakLines: false;
		nextText