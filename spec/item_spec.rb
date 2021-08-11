require './lib/item'
require 'pry'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
  end

  it 'exists and has attributes' do
    expect(@item1).to be_an(Item)
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item1.bids).to eq({})
    expect(@item1.bidding_status).to eq('open')
  end

  it 'can add bids' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    result = {@attendee2 => 20,
              @attendee1 => 22}
    expect(@item1.bids).to eq(result)
  end

  it 'has current high bid' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.current_high_bid).to eq(22)
  end

  it 'has no bids' do
    expect(@item1.no_bids?).to eq(true)
    @item1.add_bid(@attendee2, 20)
    expect(@item1.no_bids?).to eq(false)
  end

  it 'has bidder names' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.bidder_names).to eq(["Bob", "Megan"])
  end

  it 'has bidders' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    expect(@item1.bidders).to eq([@attendee2, @attendee1])
  end

  it 'has open bids?' do
    expect(@item1.open?).to eq(true)
  end

  it 'can close bids' do
    expect(@item1.open?).to eq(true)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    result = {@attendee2 => 20,
              @attendee1 => 22}
    expect(@item1.bids).to eq(result)
    @item1.close_bidding
    expect(@item1.open?).to eq(false)
    @item1.add_bid(@attendee2, 25)
    expect(@item1.bids).to eq(result)
  end
end
