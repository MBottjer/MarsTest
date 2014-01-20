require 'rspec'
require './lib/plateau'

describe Plateau do

  it 'is given a height' do

    expect(plateau.height).to eq 10
    
  end

end