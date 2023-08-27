app - self-updating
selfUpdateFromMetacello

	Metacello new
		baseline: self appName;
		repository: self selfUpdateGitHubPath;
		get;
		load.