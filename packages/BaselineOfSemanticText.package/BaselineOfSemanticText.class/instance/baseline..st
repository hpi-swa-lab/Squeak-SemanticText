baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"packages"
		spec package: #SemanticText with:
			[spec postLoadDoIt: #postLoad].
		
		"groups"
		spec group: #default with: #(SemanticText)].
	
	spec for: #(#'squeak6.0.x.release') do: [
		"dependencies"
		spec
			"Various required regex capabilities and fixes. So far, there seem to be no dependencies on other trunk changes."
			package: 'Regex-Core' with:
				[spec
					repository: 'http://source.squeak.org/trunk';
					file: 'Regex-Core-ct.89'];
			package: 'Regex-Tests-Core' with:
				[spec
					repository: 'http://source.squeak.org/trunk';
					file: 'Regex-Tests-Core-ct.36'].
		
		spec package: #'SemanticTextCompatibility-Squeak60' with:
			[spec requires: #('Regex-Core' 'Regex-Tests-Core')].
		spec package: #SemanticText with: [
			spec requires: #'SemanticTextCompatibility-Squeak60']].