class Item < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	belongs_to :user
	has_many :sales
	has_attached_file :image
	has_attached_file :resource

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Sólo las imágenes permitidas"
	 
	validates_attachment_content_type :resource,
	content_type: ['application/pdf'],
	message: "Sólo pdfs permite"
	 
	validates :image, attachment_presence: true
	validates :resource, attachment_presence: true

	validates_numericality_of :price,
	greate_than: 49, message: "Debe tener al menos 50 centavos"
end
