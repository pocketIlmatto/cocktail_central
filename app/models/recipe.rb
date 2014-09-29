# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Recipe < ActiveRecord::Base
	#before_save { self.name = name.humanize}
	validates :name, presence: true, uniqueness: { case_sensitive: false}
	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients
	
	default_scope -> { order('name ASC') }
end
