support
openDockingBarMenuThat: menuBlock filterItem: filterString
	"Example:
		BaselineOfSemanticText
			openDockingBarMenuThat: [:m | m contents = 'Tools']
			filterItem: 'Squeak Inbox Talk'
	Don't delete, this has indeed senders in some TextURL attributes.
	Copied from SqueakContributionHelp class>>#openDockingBarMenuThat:filterItem:.
	"

	| dockingBar menu |
	dockingBar := (self currentWorld mainDockingBars ifEmpty: [^ self]) first.
	menu := (dockingBar submorphs select: #isMenuItemMorph) detect: menuBlock ifNone: [^ self].
	dockingBar selectItem: menu event: self currentEvent.
	menu subMenu setProperty: #matchString toValue: filterString.
	menu subMenu displayFiltered: self currentEvent.
	^ nil "do not answer a Behavior here, which would trigger another browser when sending this message from a TextURL"