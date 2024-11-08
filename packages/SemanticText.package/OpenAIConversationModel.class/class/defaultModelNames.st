constants
defaultModelNames

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self gpt4oMiniName.
	self gpt4oName.
	self o1PreviewName.
	self o1MiniName.
	
	"all others, ordered by version ascending"
	self gpt35TurboName.
	self gpt4Name.
	self gpt4_32kName.
	self gpt4TurboName.
	self gpt4TurboPreviewName.
	
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
	self gpt4o_20240806Name.
	self gpt4o_20240513Name.
	self gpt4oMini_20240718Name.
	self o1Preview_20240912Name.
	self o1Mini_20240912Name}