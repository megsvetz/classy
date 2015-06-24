class Item < ActiveRecord::Base
  belongs_to :cat
  validates_presence_of :name

  def self.by_name
    order(:name)
  end
  def self.by_price
    order(:price)
  end
end
