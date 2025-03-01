constants
defaultModelNames

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self gpt4oMiniName. "cheapest"
	self chatgpt4oLatestName. "most usual"
	self gpt4oName.
	self gpt4oAudioPreviewName.
	self gpt4oMiniAudioPreviewName.
	self o3MiniName.
	self o1Name.
	
	"all others, ordered by version ascending"
	self gpt35TurboName.
	self gpt4Name.
	self gpt4_32kName.
	self gpt4TurboName.
	self gpt4TurboPreviewName.
	self o1MiniName.
	self gpt45PreviewName.
	
	"pinned versions, ordered by version ascending, date descending"
	self gpt35Turbo0125Name.
	self gpt35Turbo1106Name.
	self gpt35Turbo0613Name.
	self gpt35Turbo16k0613Name.
	self gpt4_20240409Name.
	self gpt4_0125Name.
	self gpt4_1106Name.
	self gpt4_0613Name.
	self gpt4_32k0613Name.
	self gpt4o_20241120Name.
	self gpt4o_20240806Name.
	self gpt4o_20240513Name.
	self gpt4oMini_20240718Name.
	self gpt4oAudioPreview_20241217Name.
	self gpt4oAudioPreview_20241001Name.
	self gpt4oMiniAudioPreview_20241217Name.
	self o1Preview_20240912Name.
	self o1Preview_20240912Name.
	self o1Mini_20240912Name.
	self o3Mini_20250131Name.
	self gpt45Preview_20250227Name}