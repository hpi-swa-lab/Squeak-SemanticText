*SemanticTextCompatibility-Squeak60-sound generation-pseudo-override
stopGracefully

	super stopGracefully.
	sounds do: [:s | s stopGracefully].
