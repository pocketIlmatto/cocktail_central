class Recipe < ActiveRecord::Base
	#before_save { self.name = name.humanize}
	validates :name, presence: true, uniqueness: { case_sensitive: false}
	validates :item_id, presence: true

	has_many :ingredients, dependent: :destroy
	has_many :items, :through => :ingredients
	belongs_to :item
	default_scope -> { order('name ASC') }
end
