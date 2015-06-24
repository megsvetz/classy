require 'rails_helper'

RSpec.describe Cat, type: :model do

  context "class methods" do
    before(:each) do
      #don't forget to make them instance variables with an @ sign
      @cat_1 = Cat.create(name: "Cars")
      @cat_2 = Cat.create(name: "Music")
      @cat_3 = Cat.create(name: "Zebras")
      @cat_4 = Cat.create(name: "Zebras gold")
    end
    describe ".by_name" do
      it "orders alphabetically" do
        expect(Cat.all.by_name.first).to eq(@cat_1)
      end
    end #describe .by_name endtag
  end #context class methods endtag
end
