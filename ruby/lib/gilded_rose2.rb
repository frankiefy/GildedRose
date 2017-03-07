class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      first(item)
    end
  end

  def first(item)
    if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      second(item)
    else
      fifth(item)
    end
    tenth(item)
  end

  def second(item)
    if item.quality > 0
      third(item)
    end
  end

  def third(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      fourth(item)
    end
  end

  def fourth(item)
    if item.name.include?("Conjured")
      item.quality = item.quality - 1
    end
    item.quality = item.quality - 1
  end

  def fifth(item)
    if item.quality < 50
      item.quality = item.quality + 1
      sixth(item)
    end
  end

  def sixth(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      seventh(item)
    end
  end

  def seventh(item)
    if item.sell_in < 11
      eigth(item)
    end
    if item.sell_in < 6
      nineth(item)
    end
  end

  def eigth(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
  end

  def nineth(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
  end

  def tenth(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
    eleventh(item)
  end

  def eleventh(item)
    if item.sell_in < 0
      twelth(item)
    end
  end

  def twelth(item)
    if item.name != "Aged Brie"
      thirteenth(item)
    else
      last(item)
    end
  end

  def thirteenth(item)
    if item.name != "Backstage passes to a TAFKAL80ETC concert"
      fourteenth(item)
    else
      item.quality = item.quality - item.quality
    end
  end

  def fourteenth(item)
    if item.quality > 0
      fifteenth(item)
    end
  end

  def fifteenth(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      sixteenth(item)
    end
  end

  def sixteenth(item)
    if item.name.include?("Conjured")
      item.quality = item.quality - 1
    end
    item.quality = item.quality - 1
  end

  def seventeenth(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
