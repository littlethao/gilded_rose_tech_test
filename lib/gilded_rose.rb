# Understands to update the quality value

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
        when "Sulfuras"
          item
        when "Aged Brie"
          update_aged_brie(item)
        when "Backstage passes"
          update_backstage_passes(item)
        when "Conjured item"
          update_conjured(item)
        else
          if item.sell_in <0 && item.quality > 0
            item.quality -=1
          end
          if item.quality > 0
            item.quality -=1
          end
          item.sell_in -=1
      end
    end
  end

  def update_aged_brie(item)
    item.sell_in -=1
    item.quality += 1 if item.quality < 50
  end

  def update_backstage_passes(item)
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in > 10
    item.quality = 0 if item.sell_in < 0
    item.quality += 1 if item.sell_in <= 5 && item.quality < 50 && item.sell_in > 0
    item.quality += 2 if item.sell_in <= 10 && item.quality < 50 && item.sell_in > 0
  end

  def update_conjured(item)
    item.sell_in -=1
    item.quality -= 2 if item.quality > 0
    item.quality == 0 if item.quality < 0
  end

end



# ----------------------
#
#   def update_quality()
#     @items.each do |item|
#       if item.name != "Aged Brie" && item.name != "Backstage passes"
#         if item.quality > 0
#           if item.name != "Sulfuras"
#             item.quality -= 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality += 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality += 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras"
#         item.sell_in -= 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes"
#             if item.quality > 0
#               if item.name != "Sulfuras"
#                 item.quality -= 1
#               end
#             end
#           else
#             item.quality -= item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality += 1
#           end
#         end
#       end
#     end
#   end
# end
