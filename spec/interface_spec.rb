require 'rspec'
require_relative '../lib/interface'

describe Interface do

  let(:interface) {Interface.new(IO.read('spec/fixtures/input.txt'))}

  it 'can convert the input from the text file into an array' do 
    expect(IO.read('spec/fixtures/input.txt').lines).to eq ["5 5\n", "1 2 N\n", "LMLMLMLMM\n", "3 3 E\n", "MMRMMRMRRM"]
  end

  it 'can convert a string seperated by spaces into an array' do 
    string = "3 6 7 2 8"
    expect(string.split).to eq ["3","6","7","2","8"]
  end

  it 'can convert an array of strings into intgers' do 
    array = ["3","6","7","2","8"]
    expect(array.map {|number| number.to_i}).to eq [3,6,7,2,8]
  end

  it 'can take the first line of input' do 
    input = IO.read('spec/fixtures/input.txt').lines.shift
    expect(interface.parse_boundaries(input)).to eq [5,5]
  end

  it 'can remove the first value in an array' do 
    array = [1,2,3,4]
    expect(array[1..-1]).to eq [2,3,4]
  end

  it 'can remove the first line of input' do 
    input = IO.read('spec/fixtures/input.txt').lines
    input.shift
    expect(input).to eq ["1 2 N\n", "LMLMLMLMM\n", "3 3 E\n", "MMRMMRMRRM"]
  end

  it 'can split an array into pairs of arrays and select the first part of each array' do 
    letters = []
    array = ["a",1,"b",2,"c",3,"d",4]
    array.each_slice(2) {|letter, number| letters << letter}
    expect(letters).to eq ["a","b","c","d"]
  end

  it 'can turn an array of arrays into an array where each element is a string' do 
    arrays = [["1 2"],["3 4"],["5 6"],["6 7"]]
    arrays = arrays.map {|array| array.join('')}
    expect(arrays).to eq ["1 2", "3 4", "5 6", "6 7"]
  end

end