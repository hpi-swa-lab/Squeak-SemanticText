app - feedback
openUrl: urlString

	self flag: #moveUpstream.
	"Something similar but less convenient is also in TextURL >> #actOnClickFor:."
	WebBrowser defaultOrNil ifNotNil: [:browser |
		(Project uiManager
			confirm: ('Do you want to open this URL in a web browser?\\{1}' withCRs format: {urlString})
			title: 'Open Web Page' translated) ifTrue: [browser openOnUrl: urlString].
		^ self].
	
	(urlString tdbAsTextWithAttribute: (TextURL new url: urlString)) editWithLabel: 'Requested URL'.