require 'rspec'
require_relative './StockPicker'

describe '#stock_picker' do
	it 'Correctly selects the best buy and sell date' do
	   expect(stock_picker([17,3,6,9,15,8,6,1,10])).to match_array([1,4])
	end
end