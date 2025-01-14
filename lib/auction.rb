class Auction
  attr_reader :items, :date
  def initialize
    @items = []
    @date = Date.today.to_s
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

  def bidders
    @items.flat_map do |item|
      item.bidder_names
    end.uniq
  end

  def active_attendees
    @items.flat_map do |item|
      item.bidders
    end.uniq
  end

  def attendee_items(attendee)
    @items.find_all do |item|
      item.bidders.include?(attendee)
    end
  end

  def bidder_info
    info = {}
    active_attendees.each do |attendee|
      info[attendee] = {budget: attendee.budget,
                        items: attendee_items(attendee)}
    end
    info
  end
end
