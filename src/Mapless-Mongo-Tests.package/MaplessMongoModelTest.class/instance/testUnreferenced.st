tests
testUnreferenced
	"Tests MaplessMongoModel>>#unreferenced"
	| person tagsCollection loaded reified |
	
	self do: [ 
	tagsCollection := OrderedCollection new
		 add: (DummyTag new
			isCustomer: true;
			yourself);
		add: (DummyTag new
			isComplicated: false;
			yourself); 
		yourself.
			
	person := DummyPerson new
			firstName: 'john';
			lastName: 'q';
			yourself.
			
	"Save all tags in the collection"
	person tags: tagsCollection.
	
	self assert: person isUnsaved.
	"save tagsCollection"	
	tagsCollection do: [:e | self do: [ e save ] ].
	
	self do:[ person save ].
	self deny: person isUnsaved.
	
	self do:[ loaded := DummyPerson findId: person id].
	
	self assert: loaded notNil.
	self deny: loaded isUnsaved.
	
	self do: [ reified := loaded unreferenced ].

	self assert: reified data tags class = OrderedCollection.
	self assert: (reified data tags first class = MaplessReference) not. 
	self assert: (reified data tags second class = MaplessReference) not.
	
	self assert: reified data tags first isCustomer.
	self assert: (reified data tags second isComplicated = false)]