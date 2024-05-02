(PackageInfo named: 'SemanticText') preamble: '"agents: bootstrap pragma parser"
((Smalltalk classNamed: #SemanticAgent) ifNil: [false] ifNotNil: [:agentClass | agentClass includesSelector: #parserClass]) ifFalse:
	[Utilities useAuthorInitials: ''SemanticText'' during:
		[Parser compile: ''function
	"Temporary parser for bootstrapping the SemanticText package!! Once SemanticAgent class>>parserClass has been installed, this method will be removed and all <function:> methods are recompiled."
	<pragmaParser>

	here = #function: ifFalse: [^ false].
	
	[(hereType == #binary and: [here = #>])] whileFalse: [self advance].'' classified: ''*SemanticText-Model-Agents-pragmas-bootstrapping''].
	(Smalltalk at: #SemanticTextPostLoadActions ifAbsentPut: [OrderedCollection new])
		add:
			[Parser removeSelector: #function.
			(Smalltalk at: #SemanticAgent) withAllSubclassesDo: [:class | class compileAll]]].'!
