app - self-updating
selfUpdateBranch
	<preference: 'SemanticText self-update branch'
		category: #SimulationStudio
		description: 'The branch used for installing updates for SemanticText from the GitHub repository.'
		type: #String>
	
	^ SelfUpdateBranch ifNil: [self defaultSelfUpdateBranch]