app - self-updating
defaultSelfUpdateBranch

	(self environment classNamed: #MCRepositoryGroup) ifNotNil: [:mcRepositoryGroupClass |
		| repoPrefix |
		repoPrefix := 'github://{1}/{2}' format: {self githubRepositoryParams first. self githubRepositoryParams second}.
		mcRepositoryGroupClass default repositories
			detect: [:repo | repo description beginsWith: repoPrefix]
			ifFound: [:repo | ^ repo projectVersion]].
	
	^ 'main'