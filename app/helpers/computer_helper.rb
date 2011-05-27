module ComputerHelper
	def getIdFromName(x)
		re = Computer.first(:name => x)
		return re.id
	end
end
