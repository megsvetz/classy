require 'rails_helper'

RSpec.describe Item, type: :model do

  context "class methods" do
    before(:each) do
      @item_1 = Item.create(name:"Old Couch", price:50.00, description: "Well loved, but great for spooning!", cat_id: 6)
      @item_2 = Item.create(name:"Fridge", price:157, description: "French door stainless steel LG fridge, 2006...in working condition.", cat_id: 4)
      @item_3 = Item.create(name:"Dining Table and Chair Set", price:79, description: "Oak square dining table and chair set, includes 4 chairs. Pick-up only.", cat_id: 2)
      @item_4 = Item.create(name:"Bike", price:125, description: "2002 Cannondale bike.", cat_id: 3)
    end

    describe ".by_name" do
      it "alphabetizes by name" do
        expect(Item.all.by_name.first).to eq(@item_4)
      end
    end

    describe ".by_price" do
      it "orders by price" do
        expect(Item.all.by_price.first).to eq(@item_1)
      end
    end

    describe "validations" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:price) }
    end

    describe "relationships" do
      it { should belong_to(:cat) }
    end
  end #context class methods endtag

end
