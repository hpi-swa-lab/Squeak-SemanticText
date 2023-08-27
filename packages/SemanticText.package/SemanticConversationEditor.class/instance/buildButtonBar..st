toolbuilder
buildButtonBar: builder

	^ builder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children:
			(OrderedCollection new
				addAll:
					(self allRoles collect: [:role |
						builder pluggableActionButtonSpec new
							model: self;
							label: ('+{1}' format: {role capitalized});
							help: ('Add {1} message' format: {role});
							action: ('add{1}Message' format: {role capitalized}) asSymbol;
							yourself]);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: 'Complete';
						action: #complete;
						enabled: #canComplete;
						yourself);
				add:
					(builder pluggableActionButtonSpec new
						model: self;
						label: 'Cancel';
						action: #cancel;
						enabled: #canCancel;
						yourself);
				yourself);
		yourself