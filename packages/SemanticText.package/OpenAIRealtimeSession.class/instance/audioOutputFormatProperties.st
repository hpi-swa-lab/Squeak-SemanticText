client events - private
audioOutputFormatProperties

	^ JsonObject new
		type: 'audio/pcm';
		rate: self outputSamplingRate;
		yourself