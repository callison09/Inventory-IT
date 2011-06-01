class Computer
	include MongoMapper::Document

	key :name, String, :required => true, :unique => true
	key :sn, String, :required => true, :unique => true
	key :status, String
	key :mtype, String
	key :loc, String
	key :dpt, String
	key :make, String
	key :model, String

	key :servicetag, String
	key :chip, String
	key :cpuclock, String
	key :ram, String
	key :hdd, String
	key :ipaddy, String
	key :macaddy, String
	key :wimacaddy, String
	key :servicenotes, String
	key :comments, String
	key :productcode, String
	key :barcode, String
	key :creator, String
	key :updater, String
	timestamps!

	ensure_index :created_at
	ensure_index :updated_at 
	
	many :softwares
	many :comments



end