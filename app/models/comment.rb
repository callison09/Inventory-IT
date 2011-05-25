class Comment
	include MongoMapper::EmbeddedDocument
	
	key :author, String, {required: true}
	key :coolstorybro, String, {required: true}

end