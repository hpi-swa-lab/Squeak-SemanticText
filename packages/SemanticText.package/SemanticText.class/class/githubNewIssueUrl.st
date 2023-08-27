app - feedback
githubNewIssueUrl

	^ self githubNewIssueUrlWithBody: '<!-- Your feedback goes here -->\' withCRs, (String streamContents: [:stream |
		(HtmlReadWriter on: stream)
			breakLines: false;
			nextPutText: self defaultFeedbackText])