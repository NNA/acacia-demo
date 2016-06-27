class Project < ActiveRecord::Base
  validates_presence_of 		:name, :description, :place, :category_id, :amount
  validates_numericality_of 	:amount

  belongs_to :category

  scope :with_categories,  -> {includes(:category)}
  scope :recent, 		   -> { order('created_at DESC') }
end
