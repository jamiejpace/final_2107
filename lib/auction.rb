require 'date'

class Auction
  attr_reader :items,
              :date

  def initialize
    @items = []
    @date = DateTime.now.strftime('%d/%m/%Y')
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
      item.number_of_bids == 0
    end
  end

  def popular_items
    @items.find_all do |item|
      item.number_of_bids >= 1
    end
  end

  def potential_revenue
    popular_items.sum do |item|
      item.current_high_bid
    end
  end

  def bidders
    @items.flat_map do |item|
      item.bidders
    end.uniq
  end

  def bidder_info
    info = {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        if info[attendee].nil?
          info[attendee] = {:budget => attendee.budget, :items => [item]}
        else
          info[attendee][:items] << item
        end
      end
    end
    info
  end

  # def close_auction
  #   closed = {}
  #   @items.each do |item|
  #     closed[item] = item.current_high_bid
  #   end
  # end
end
