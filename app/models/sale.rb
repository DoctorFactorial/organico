class Sale < ActiveRecord::Base
	before_create :populate_guid
	belongs_to :item

	private

	def populate_guid
		self.guid = SecureRandom.uuid()
	end

end
