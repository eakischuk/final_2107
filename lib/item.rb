class Item
  attr_reader :name, :bids, :bidding_status
  def initialize(name)
    @name = name
    @bids = {}
    @bidding_status = 'open'
  end

  def add_bid(attendee, bid)
    if open?
      @bids[attendee] = bid
    end
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

  def open?
    @bidding_status == 'open'
  end

  def close_bidding
    @bidding_status = "closed"
  end
end
