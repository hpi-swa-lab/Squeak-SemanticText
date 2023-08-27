app - feedback
githubNewIssueUrlWithBody: htmlString

	^ 'https://github.com/{1}/{2}/issues/new?{3}' format: {
		self githubRepositoryParams first.
		self githubRepositoryParams second.
		WebUtils encodeUrlEncodedForm: {
			'body' -> htmlString}}