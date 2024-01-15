accessing
temperature
	"Sampling temperature between 0 and 2 (defaults to 1). Controls the randomness and diversity of outputs. A minimal temperatures causes an almost deterministic output, while higher temperatures result in more creativity and hallucinations. See also #nucleusSamplingMass. It is disrecommended to modfiy both temperature and nucleusSamplingMass. For deciding between both parameters, experimentation with either is adviced."

	^ self argumentAt: #temperature