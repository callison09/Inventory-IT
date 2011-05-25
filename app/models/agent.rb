class Agent
	include MongoMapper::EmbeddedDocument

	key :fname, String, {required: true}
	key :lname, String, {required: true}


end