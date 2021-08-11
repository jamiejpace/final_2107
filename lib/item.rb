class Item
  attr_reader :name,
              :bids,
              :bidding_open

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_open = true
  end

  def add_bid(attendee, amount)
    if bidding_open?
      @bids[attendee] = amount
    end
  end

  def current_high_bid
    bid_amounts = @bids.map do |attendee, bid|
      bid
    end.max
  end

  def number_of_bids
    @bids.length
  end

  def bidders
    @bids.map do |attendee, amount|
      attendee.name
    end
  end

  def bidding_open?
    @bidding_open
  end

  def close_bidding
    @bidding_open = false
  end

end
