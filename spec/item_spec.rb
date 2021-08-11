require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Item do
  it 'exists and has attributes' do
    item1 = Item.new('Chalkware Piggy Bank')

    expect(item1).to be_a(Item)
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it 'adds bids' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.bids).to eq({attendee2=> 20, attendee1=>22})
  end

  it 'lists highest bid' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)
  end

  it 'counts number of bids' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.number_of_bids).to eq(2)
  end

  it 'lists names of bidders' do
      item1 = Item.new('Chalkware Piggy Bank')
      attendee1 = Attendee.new(name: 'Megan', budget: '$50')
      attendee2 = Attendee.new(name: 'Bob', budget: '$75')

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bidders).to eq(["Bob", "Megan"])
  end

  it 'closes bidding' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')

    expect(item1.bidding_open?).to be true

    item1.close_bidding

    expect(item1.bidding_open?).to be false
  end

  it 'will not add bid if bidding closed' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    item1.close_bidding

    item1.add_bid(attendee3, 70)

    expect(item1.bids).to eq({attendee2=> 20, attendee1=>22})
  end

end
