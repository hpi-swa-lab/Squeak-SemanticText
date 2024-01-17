toolbuilder
buildWith: builder

	| specs |
	specs := OrderedCollection new.
	specs add:
		(LayoutFrame fullFrame
			bottomOffset: self buttonBarHeight negated * (1 + self isAdvancedMode asBit) - (builder windowSpacing * self isAdvancedMode asBit);
			-> [self buildTextPane: builder]).
	specs add:
		(LayoutFrame fullFrame
			topFraction: 1;
			topOffset: self buttonBarHeight negated * (1 + self isAdvancedMode asBit);
			bottomOffset: self buttonBarHeight negated * self isAdvancedMode asBit;
			-> [self buildButtonBar: builder]).
	self isAdvancedMode ifTrue:
		[specs add:
			(LayoutFrame fullFrame
				topFraction: 1;
				topOffset: self buttonBarHeight negated + builder windowSpacing;
				bottomOffset: builder windowSpacing;
				-> [self buildAdvancedButtonBar: builder])].
	
	^ builder build:
		(self buildWindowWith: builder specs: specs)