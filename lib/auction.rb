class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.no_bids?
    end
  end

  def bid_on_items
    @items.find_all do |item|
      !item.no_bids?
    end
  end

  def potential_revenue
    bid_on_items.sum do |item|
      item.current_high_bid
    end
  end
end
