client events - private
transcriptionProperties

	^ JsonObject new
		model: self speechTranscriptionModel name;
		in: [:json |
			self transcriptionLanguage ifNotNil: [:lang | json language: lang].
			self transcriptionPrompt ifNotNil: [:prompt | json prompt: prompt]];
		yourself