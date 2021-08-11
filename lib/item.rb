class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    bid_amounts = @bids.map do |attendee, bid|
      bid
    end.max
  end

  def number_of_bids
    @bids.length
  end
end
