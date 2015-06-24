class Cat < ActiveRecord::Base
  has_many :items
  validates_presence_of :name

  def self.by_name
    order(:name)  
  end
end
