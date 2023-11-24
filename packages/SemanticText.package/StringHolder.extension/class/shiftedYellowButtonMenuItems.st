*SemanticText-Tools-*Tools-yellow button menu-override
shiftedYellowButtonMenuItems 
	"Returns the standard yellow button menu items"
	| entries |
	entries := OrderedCollection withAll:
		{
			#-.
			{'pretty print' translated.				#prettyPrint}.
			{'pretty print with color' translated.		#prettyPrintWithColor}.
			{'file it in (G)' translated.					#fileItIn}.
			{'spawn (o)' translated.					#spawn}.
			#-.
			{'browse it (b)' translated.				#browseIt}.
			{'senders of it (n)' translated.			#sendersOfIt}.
			{'implementors of it (m)' translated.		#implementorsOfIt}.
			{'references to it (N)' translated.			#referencesToIt}.
			#-.
			{'selectors containing it (W)' translated.	#methodNamesContainingIt}.
			{'method strings with it (E)' translated.	#methodStringsContainingit}.
			{'method source with it' translated.		#methodSourceContainingIt}.
			{'class names containing it' translated.	#classNamesContainingIt}.
			{'class comments with it' translated.		#classCommentsContainingIt}.
			{'change sets with it' translated.			#browseChangeSetsWithSelector}.
			#-.
			{'save contents to file...' translated.		#saveContentsInFile}.
			{'send contents to printer' translated.		#sendContentsToPrinter}.
			{'printer setup' translated.				#printerSetup}.
			#-.
			{'explain it' translated.		#semanticExplainIt}.
			{'summarize it ' translated.		#semanticSummarizeIt}.
		}.
	Smalltalk isMorphic ifFalse: [ entries add: 
			{'special menu...' translated.				#presentSpecialMenu}.].
	entries add:
			{'more...' translated.					#yellowButtonActivity}.
	^ entries