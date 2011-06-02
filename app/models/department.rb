class Department
	include MongoMapper::Document
	key :name, String, {required: true}
	key :location, String, {required: true}
	key :manager, String, {requried: true}
	timestamps!
	
	ensure_index :name

	many :agents
	
end