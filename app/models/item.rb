class Item < ActiveRecord::Base
	before_save { self.name = name.downcase }
	has_one :recipe
	has_many :ingredients
	has_many :recipes, :through => :ingredients
	default_scope -> { order('name ASC') }

	def item_name
		item.name if item
	end

	def item_name=(name)
		self.name = Item.find_or_create_by_name(name) unless name.blank?
	end
end
