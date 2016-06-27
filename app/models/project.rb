class Project < ActiveRecord::Base
  validates_presence_of 		:name, :description, :place, :category_id, :amount
  validates_numericality_of 	:amount

  belongs_to :category
end
