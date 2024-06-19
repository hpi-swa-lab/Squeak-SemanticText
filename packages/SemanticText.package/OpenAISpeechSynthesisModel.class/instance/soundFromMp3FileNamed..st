private
soundFromMp3FileNamed: fullName

	"MPEGPlugin does not work properly on Linux!"
	"^ (MPEGPlayer playFile: (FileDirectory default fullNameFor: fullName))
		setupStream: 0;
		openAIAsSoundFromAudioStream: 0"
	
	| pipeableOSProcessClass |
	self flag: #todo. "test and probably fix for windows!"
	pipeableOSProcessClass := (Smalltalk classNamed: #PipeableOSProcess) ifNil:
		[^ self error: 'Cannot convert mp3 without CommandShell'
		"Install it via:
			Installer ss project: 'OSProcess'; install: 'OSProcess'.
			Installer ss project: 'CommandShell'; install: 'CommandShell'.
		"].
	^ FileStream readOnlyFileNamed: fullName do: [:mp3Stream |
		| osProcess samples |
		osProcess := pipeableOSProcessClass
			command: 'ffmpeg -i pipe:0 -f wav pipe:1'
			environment: nil
			workingDir: nil
			input: mp3Stream binary
			output: nil
			error: nil
			errorPipelineStream: nil.
		samples := ByteArray streamContents: [:waveStream |	
			osProcess outputOn: waveStream].
		osProcess exitCode isZero ifFalse: [^ self error: 'Could not convert mp3 using ffmpeg, is it installed?'].
		SampledSound fromWaveStream: samples readStream]