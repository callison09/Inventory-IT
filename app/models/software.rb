class Software
	include MongoMapper::EmbeddedDocument

	key :name, String, {required: true}
	key :dev, String, {required: true}
	key :sn, String, {required: true}
	key :pass, String
	

end