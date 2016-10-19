require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "degrades by 1 SellIn value and 1 quality value each day on normal items" do
      items = [Item.new("nutella", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
      expect(items[0].quality).to eq(18)
    end

    it "degrades double in quality value when SellIn value < 0" do
      items = [Item.new("nutella", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
      expect(items[0].quality).to eq(18)
    end

    it "does not increase quality value exceeding 50" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(9)
      expect(items[0].quality).to eq(50)
    end

  end

  describe "Aged Brie" do
    it "increases in quality when decreasing in SellIn value" do
      items = [Item.new("Aged Brie", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(9)
      expect(items[0].quality).to eq(21)
    end
  end

  describe "Sulfuras" do
    it "does not degrade in both values" do
      items = [Item.new("Sulfuras", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(0)
      expect(items[0].quality).to eq(50)
    end
  end

  describe "Backstage passes" do
    context "SellIn value > 10" do
      it "decreases by 1 SellIn value and increases by 1 Quality value" do
        items = [Item.new("Backstage passes", 30, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq(29)
        expect(items[0].quality).to eq(11)
      end
    end

    context "SellIn value < 11" do
      it "decreases by 1 SellIn value and increases by 2 Quality value" do
        items = [Item.new("Backstage passes", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq(9)
        expect(items[0].quality).to eq(12)
      end
    end

    context "SellIn value < 6" do
      it "decreases by 1 SellIn value and increases by 3 Quality value" do
        items = [Item.new("Backstage passes", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq(4)
        expect(items[0].quality).to eq(13)
      end
    end

    context "SellIn value < 1" do
      it "decreases by 1 SellIn value and drops to 0 Quality value" do
        items = [Item.new("Backstage passes", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq(-1)
        expect(items[0].quality).to eq(0)
      end
    end

  end

end
