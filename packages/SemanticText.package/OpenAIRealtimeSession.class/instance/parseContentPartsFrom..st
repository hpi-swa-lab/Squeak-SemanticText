parsing
parseContentPartsFrom: jsons

	^ jsons gather: [:json |
		 json type caseOf:
			{['input_text'] -> [{self parseContentPartForTextFrom: json}].
			['output_text'] -> [{self parseContentPartForTextFrom: json}].
			['input_image'] -> [{self parseContentPartForImageFrom: json}].
			['input_audio'] -> [self parseContentPartsForInputAudioFrom: json].
			['output_audio'] -> [self parseContentPartsForOutputAudioFrom: json]}]