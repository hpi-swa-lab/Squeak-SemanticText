toolbuilder
buildWith: builder

	| spec |
	spec := self buildWindowWith: builder specs:
		{LayoutFrame fullFrame
			bottomOffset: self buttonBarHeight negated;
			-> [self buildTextPane: builder].
		LayoutFrame fullFrame
			topFraction: 1;
			topOffset: self buttonBarHeight negated;
			-> [self buildButtonBar: builder]}.
	^ builder build: spec