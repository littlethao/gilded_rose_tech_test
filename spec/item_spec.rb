require 'item'

describe Item do
  let(:name) { double :name }
  let(:sell_in) { double :sell_in }
  let(:quality) { double :quality }
  subject(:item) { described_class.new name, sell_in, quality}

  describe "#initialize" do
    it 'knows the name of an item' do
      expect(item.instance_variable_get(:@name)).to eq(name)
    end

    it 'knows the SellIn value of an item' do
      expect(item.instance_variable_get(:@sell_in)).to eq(sell_in)
    end

    it 'knows the Quality value of an item' do
      expect(item.instance_variable_get(:@quality)).to eq(quality)
    end
  end

  describe "#to_s" do
    it 'returns the string representation of item specifications' do
      expect(item.to_s).to eq("#[Double :name], #[Double :sell_in], #[Double :quality]")
    end
  end
end
