private
serverUrl

	| httpsUrl baseUrl url |
	httpsUrl := self model account baseUrl.
	baseUrl := httpsUrl copyWithRegex: '^http(?=s?\://)' matchesReplacedWith: 'ws'. "i.e., 'wss://'".
	url := baseUrl , self pathToEndpoint.
	^ url , '?model=' , self model name