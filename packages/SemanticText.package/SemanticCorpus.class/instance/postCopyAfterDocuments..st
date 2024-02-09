copying
postCopyAfterDocuments: postCopyDocumentsBlock

	clusters ifNotNil:
		[| documentCopies |
		self flag: #untested.
		documentCopies := postCopyDocumentsBlock value.
		clusters := clusters associations
			collect: [:centerAndCluster |
				centerAndCluster key copy ->
					(centerAndCluster value collect: [:oldDocument |
						documentCopies at: oldDocument])]].