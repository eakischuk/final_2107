class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    @bids.values.max_by do |bid|
      bid
    end
  end

  def no_bids?
    @bids.empty?
  end

  def bidder_names
    @bids.keys.map do |attendee|
      attendee.name
    end
  end

  def bidders
    @bids.keys
  end
end
