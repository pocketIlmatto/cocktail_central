# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  item_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Recipe < ActiveRecord::Base
	#before_save { self.name = name.humanize}
	validates :name, presence: true, uniqueness: { case_sensitive: false}
	validates :item_id, presence: true

	has_many :ingredients, :through => :recipes_ingredients
	
	default_scope -> { order('name ASC') }
end
