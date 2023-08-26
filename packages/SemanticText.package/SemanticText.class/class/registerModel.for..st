registry - generic
registerModel: aModel for: type

	(self registeredModels at: type ifAbsentPut: [Set new])
		add: aModel.