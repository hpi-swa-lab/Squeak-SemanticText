initializing
initialize

	super initialize.
	consumed := ReadWriteStream on: #().
	closed := false.
	closedToken := Object new.