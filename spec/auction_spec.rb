require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it 'exists and has attributes' do
    expect(@auction).to be_an(Auction)
    expect(@auction.items).to eq([])
  end
end
