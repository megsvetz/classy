class Item < ActiveRecord::Base
  belongs_to :cat
  validates_presence_of :name
  has_attached_file :item_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :item_pic, :content_type => /\Aimage\/.*\Z/

  def self.by_name
    order(:name)
  end
  def self.by_price
    order(:price)
  end
end
