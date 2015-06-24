class Item < ActiveRecord::Base
  belongs_to :cat
  validates_presence_of :name, :price
end
