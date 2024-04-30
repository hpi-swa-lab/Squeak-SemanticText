*SemanticText-Tools-Conversation-tests - formatting
testSemanticFormatAttributes

	{
		'\{ \` \} \\ `foo`[1] {1} ``bar`[2] {2}`[3]'. #(12 'string'). {TextEmphasis bold. TextEmphasis italic. {TextEmphasis bold. TextEmphasis underlined}}. '{ ` } \ <b>foo</b> 12 <b><u><i>bar</i> string</u></b>' asTextFromHtml.
		'\{ \` \} \\ `foo`[2] {2} ``bar`[3] {1}`[1]'. #('string' 12). {{TextEmphasis bold. TextEmphasis underlined}. TextEmphasis bold. TextEmphasis italic}. '{ ` } \ <b>foo</b> 12 <b><u><i>bar</i> string</u></b>' asTextFromHtml.
		'\{1} \`a\`[1]'. #(). #(). '{1} `a`[1]' asText.
		'\{1}{1} \`a\`[1]`a\`[1]`[2]`a`[1] [b] `c`\[d]`[1]`[2]'. #($a). {TextEmphasis bold. TextEmphasis italic}. '{1}a `a`[1]<i>a`[1]</i><b>a</b> [b] <i>c<b>[d]</b></i>' asTextFromHtml.
		'a``[1]z'. #(). {TextEmphasis bold}. 'az' asText.
		'\{ \` \} \\ `foo`[one] {ONE} ``bar`[two] {TWO}`[three]'. {'ONE'->12. 'TWO'->'string'} as: Dictionary. {'one'->TextEmphasis bold. 'two'->TextEmphasis italic. 'three'->{TextEmphasis bold. TextEmphasis underlined}} as: Dictionary. '{ ` } \ <b>foo</b> 12 <b><u><i>bar</i> string</u></b>' asTextFromHtml.
		'\{ \` \} \\ `foo`[two] {TWO} ``bar`[three] {ONE}`[one]'. {'ONE'->'string'. 'TWO'->12} as: Dictionary. {'one'->{TextEmphasis bold. TextEmphasis underlined}. 'two'->TextEmphasis bold. 'three'->TextEmphasis italic} as: Dictionary. '{ ` } \ <b>foo</b> 12 <b><u><i>bar</i> string</u></b>' asTextFromHtml.
		'\{ \` \} \\ `foo`[two] {TWO} ``bar`[three] {ONE}`[one]'. {'ONE'->'string'. 'TWO'->[3*4]} as: Dictionary. {'one'->[{TextEmphasis bold} , {TextEmphasis underlined}]. 'two'->TextEmphasis bold. 'three'->[TextEmphasis italic]} as: Dictionary. '{ ` } \ <b>foo</b> 12 <b><u><i>bar</i> string</u></b>' asTextFromHtml.
		'\{ONE} \`foo\`[one]'. #(). #(). '{ONE} `foo`[one]' asText.
		'\{ONE}{ONE} \`foo\`[one]`foo\`[one]`[two]`foo`[one] [bar] `griffle`\[plonk]`[one]`[two]'. {'ONE'->$a} as: Dictionary. {'one'->TextEmphasis bold. 'two'->TextEmphasis italic} as: Dictionary. '{ONE}a `foo`[one]<i>foo`[one]</i><b>foo</b> [bar] <i>griffle<b>[plonk]</b></i>' asTextFromHtml.
		'foo'. #(). #(). 'foo' asText.
	} groupsDo: [ :receiver :argument :attributes :expectedResult |
		| actualResult |
		actualResult := receiver format: argument attributes: attributes.
		self assert: expectedResult asStringToHtml equals: actualResult asStringToHtml ].
	#(
		'{'
		'{}'
		'{1 }'
		'{1abc}'
		'{ 1}'
		'{ 1.0 }'
		'{1'
		'{1 foo'
		'{2}'
		'{0}'
		'{-0}'
		'{-1}'
		'`'
		'`foo`'
		'`foo`['
		'`foo`[]'
		'`foo`bar[1]'
		'\`foo`[1]'
		'`foo\`[1]'
		'`foo`[1 ]'
		'`foo`[1abc ]'
		'`foo`[ 1]'
		'`foo`[ 1.0 ]'
		'`foo`[1'
		'`foo`[1 bar'
		'`foo`[2]'
		'`foo`[0]'
		'`foo`[-0]'
		'`foo`[-1]'
	) do: [ :each |
		self should: [ each semanticFormat: { 'x' } attributes: {TextEmphasis bold} ] raise: Error ].