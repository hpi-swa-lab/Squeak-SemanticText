actions
toggleVoiceActivityDetection

	self conversation updateConfig: [:config |
		config shouldDetectVoiceActivity: self voiceActivityDetectionEnabled not].