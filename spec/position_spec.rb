require 'rspec'
require_relative '../lib/position'

describe Position do 

  let(:position) {Position.new}

  it 'has a an x_coordinate' do 
    expect(position.x_coord).to eq 0
  end


end