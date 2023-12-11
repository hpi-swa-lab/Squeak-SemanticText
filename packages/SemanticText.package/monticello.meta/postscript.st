(PackageInfo named: 'SemanticText') postscript: 'OpenAIAccount allSubInstancesDo: [:account |
	(account instVarNamed: ''ignoreCertificate'') ifNil:
		[account instVarNamed: ''ignoreCertificate'' put: false]].'!
