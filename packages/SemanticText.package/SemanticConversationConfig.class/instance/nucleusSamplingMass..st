accessing
nucleusSamplingMass: aNumber
	"Probabilitiy mass for nucleus sampling in (0, 1] (defaults to 1). Controls the coherence of outputs. A lower sampling mass excludes less probable words in the output, resulting in higher coherence and reduced creativity. Also referred to as top-p sampling. See also #temperature. It is disrecommended to modify both temperature and nucleusSamplingMass. For deciding between both parameters, experimentation with either is adviced."

	self argumentAt: #nucleusSamplingMass put: aNumber.