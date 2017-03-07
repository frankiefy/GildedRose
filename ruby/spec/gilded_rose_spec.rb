require './lib/gilded_rose2'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "Regular Items & special item's normal charactersitics" do

      it 'quality decreases by 1' do
        items = [Item.new("foo", 10, 5)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 4
      end

      it 'quality decreases 2x after sell_in' do
        items = [Item.new("foo", 0, 5)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 3
      end

      it 'quality is never < 0' do
        items = [Item.new("foo", 10, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'sell_in decreases by 1' do
        items = [Item.new("foo", 10, 5)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end

    end

    context "Special Items" do

      it 'quality limited to 50' do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      context "Sulfuras" do

        it 'sell_in does not decrease' do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 10
        end

        it 'quality does not decrease' do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 5
        end

      end

      context "Backstage Passes" do

        it 'quality increases by 1' do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 6
        end

        it 'quality increases by 2 when < 11 days left' do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 7
        end

        it 'quality increases by 3 when < 6 days left' do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 8
        end

        it 'quality is 0 after sell_in' do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 0
        end
      end

      context "Aged Brie" do

        it 'quality increases by 1' do
          items = [Item.new("Aged Brie", 10, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 6
        end

      end
    end

    context "Added items" do
      context "Conjured" do

        it 'quality decreases by 2' do
          items = [Item.new("Conjured fucks to give", 10, 8)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 6
        end

        it 'quality decreases 2x after sell_in' do
          items = [Item.new("Conjured fucks to give", 0, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 1
        end

        it 'quality is never < 0' do
          items = [Item.new("Conjured fucks to give", 10, 0)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 0
        end

        it 'sell_in decreases by 1' do
          items = [Item.new("Conjured fucks to give", 10, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 9
        end

      end
    end

  end
end
