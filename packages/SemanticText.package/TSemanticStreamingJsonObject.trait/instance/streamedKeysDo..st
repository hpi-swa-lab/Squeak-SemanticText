accessing - streaming
streamedKeysDo: aBlock 

	self streamedAssociationsDo: [:association | aBlock value: association key]