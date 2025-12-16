event handlers
initializeEventHandlers

	eventHandlers := (Pragma allNamed: #serverEvent: from: self to: thisContext methodClass)
		collect: [:pragma | (pragma argumentAt: 1) -> (SortedCollection with: pragma selector)]
		as: Dictionary.
	SystemChangeNotifier uniqueInstance
		noMoreNotificationsFor: self;
		notify: self ofSystemChangesOfItem: #method using: #systemEvent:.