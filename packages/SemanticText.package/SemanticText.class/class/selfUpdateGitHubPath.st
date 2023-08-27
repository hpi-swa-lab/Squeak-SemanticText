app - self-updating
selfUpdateGitHubPath

	^ ('github://{1}/{2}:\{1\}/{3}' format: {
		self githubRepositoryParams first.
		self githubRepositoryParams second.
		self githubRepositoryParams third}) format: {self selfUpdateBranch}