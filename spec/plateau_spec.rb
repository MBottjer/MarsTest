require 'rspec'
require_relative '../lib/plateau'

describe Plateau do

  let(:plateau) {Plateau.new(5,5)}

  it 'has a specified height' do
    expect(plateau.y_boundary).to eq 5
  end

end