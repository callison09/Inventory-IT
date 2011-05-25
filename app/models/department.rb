class Department
	include MongoMapper::Document
	key :location, String, {required: true}
	key :manager, String, {requried: true}
	timestamps!
	
	many :agents
	
end