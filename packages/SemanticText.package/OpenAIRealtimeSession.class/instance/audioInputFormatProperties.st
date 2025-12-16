client events - private
audioInputFormatProperties

	^ JsonObject new
		type: 'audio/pcm';
		rate: self inputSamplingRate;
		yourself