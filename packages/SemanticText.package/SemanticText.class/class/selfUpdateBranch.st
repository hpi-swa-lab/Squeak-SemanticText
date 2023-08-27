app - self-updating
selfUpdateBranch
	<preference: 'SimulationStudio self-update branch'
		category: #SimulationStudio
		description: 'The branch used for installing updates for SimulationStudio from the GitHub repository.'
		type: #String>
	
	^ SelfUpdateBranch ifNil: [self defaultSelfUpdateBranch]