class Software
	include MongoMapper::EmbeddedDocument

	key :name, String
	key :dev, String
	key :sn, String
	key :pass, String
	

end