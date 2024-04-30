*SemanticText-Tools-Conversation-fixtures
semanticFixturesFormatAttributes

	^ {
		{ '\{ \} \\ `foo`[1] {1} ``bar`[2] {2}`[3]' asText
				addAttribute: TextEmphasis bold from: 3 to: 11;
				addAttribute: TextEmphasis italic from: 13 to: 25;
				yourself.
			#(12 'string').
			{ TextEmphasis underlined. TextEmphasis bold. { TextEmphasis underlined } }.
			'{ } \ foo 12 bar string' asText
				addAttribute: TextEmphasis bold from: 2 to: 7;
				addAttribute: TextEmphasis underlined from: 7 to: 9;
				addAttribute: TextEmphasis italic from: 9 to: 14;
				addAttribute: TextEmphasis bold from: 14 to: 16;
				addAttribute: TextEmphasis underlined from: 14 to: 23;
				yourself }.
		{ '\{ \} \\ `foo`[2] {2} ``bar`[3] {1}`[1]' asText.
			{ 'string' asText
				addAttribute: TextEmphasis bold from: 2 to: 4;
				yourself.
				12 }.
			{ { TextEmphasis italic }.  TextEmphasis italic. TextEmphasis underlined }.
			'{ } \ foo 12 bar string' asText
				addAttribute: TextEmphasis italic from: 7 to: 9;
				addAttribute: TextEmphasis underlined from: 14 to: 16;
				addAttribute: TextEmphasis italic from: 14 to: 23;
				addAttribute: TextEmphasis bold from: 19 to: 21;
				yourself }.
		{ '\{1} \`a\`[1]' asText.
			#().
			#().
			'{1} `a`[1]' asText }.
		{ '\{1}{1} \`a\`[1]`a\`[1]`[2]`a`[1] [b]' asText allBold.
			{ $a asText
				addAttribute: TextEmphasis italic;
				yourself }.
			{ TextEmphasis bold. TextEmphasis underlined }.
			'{1}a `a`[1]a`[1]a [b]' asText allBold
				addAttribute: TextEmphasis italic from: 4 to: 4;
				addAttribute: TextEmphasis underlined from: 12 to: 16;
				addAttribute: TextEmphasis bold from: 17 to: 17;
				yourself }.
		{ 'foo' asText.
			#().
			#().
			'foo' asText }.
	}