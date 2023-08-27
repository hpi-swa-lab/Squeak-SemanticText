accessing
contents

	"Keep insertion order of search results. Ignore their inherent priorities."
	^ self item subtopics collect: [ :each | 
		each asHelpTopicListItemWrapperForModel: self model parent: self]