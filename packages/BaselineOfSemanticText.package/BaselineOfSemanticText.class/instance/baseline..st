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
		spec package: #'SemanticTextCompatibility-Squeak60'.
		spec package: #SemanticText with: [
			spec includes: #'SemanticTextCompatibility-Squeak60']].