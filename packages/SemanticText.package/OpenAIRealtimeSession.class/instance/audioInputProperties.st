client events - private
audioInputProperties

	^ JsonObject new
		format: self audioInputFormatProperties;
		transcription:
			(self shouldTranscribe ifTrue:
				[self transcriptionProperties]);
		turn_detection: self turnDetectionProperties;
		yourself