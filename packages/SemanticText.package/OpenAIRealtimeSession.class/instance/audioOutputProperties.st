client events - private
audioOutputProperties

	^ JsonObject new
		format: self audioOutputFormatProperties;
		speed: self voiceSpeed;
		voice: self voiceName;
		yourself