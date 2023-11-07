app - menu
appMenu: menu

	menu add: 'show help' target: self action: #showHelp.
	
	menu addLine.
	
	menu
		add: 'send feedback...' target: self action: #sendFeedback;
		balloonTextForLastItem: 'make the author happy by giving him some feedback'.
	menu
		add: 'self-update' target: self action: #doSelfUpdate;
		balloonTextForLastItem: ('download and install the latest updates for {1}' format: {self appName}).