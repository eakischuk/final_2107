require './lib/item'
require 'pry'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
  end

  it 'exists and has attributes' do
    expect(@item1).to be_an(Item)
    expect(@item1.name).to eq('Chalkware Piggy Bank')
    expect(@item1.bids).to eq({})
  end
end
