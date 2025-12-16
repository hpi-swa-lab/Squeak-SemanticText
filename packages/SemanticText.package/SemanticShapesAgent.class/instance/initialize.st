initialize-release
initialize

	super initialize.
	
	area := Morph new
		color: Color white;
		extent: 400 px @ 300 px;
		borderColor: Color black;
		borderWidth: 1 px;
		yourself.
	shapes := Dictionary new.