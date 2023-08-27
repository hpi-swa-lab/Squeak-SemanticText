examples
exampleWorkspaces
	"
	self exampleWorkspaces
	"

	| query corpus labels similarWindows windows choice |
	query := Project uiManager request: 'Find workspaces similar to...'.
	query isEmptyOrNil ifTrue: [^ nil].
	
	windows := Project current world submorphs select: [:ea |
		(ea respondsTo: #model) and: [ea model isKindOf: Workspace]].
	corpus := SemanticPluggableCorpus
		titleBlock: #label
		contentBlock: [:ea | ea paneMorphs first textMorph text].
	corpus addFragmentDocumentsFromAll: windows.
	corpus updateEmbeddings.
	
	similarWindows := corpus findObjects: 20 similarToQuery: query.
	
	labels := similarWindows collect: [:window |
		window label , ': ' , ((window paneMorphs first textMorph text asString contractTo: 512) ifEmpty: ['(empty)'])].
	choice := Project uiManager chooseFrom: labels values: similarWindows title: 'Similar workspaces'.
	choice ifNil: [^ nil].
	^ choice addHalo