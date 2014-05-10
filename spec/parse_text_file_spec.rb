require 'spec_helper'

describe 'Parses text' do
  before do
    in_text =<<-INFILE
      [A,B,10]
      [C,D,13]
      [E,F,20]
      [A,E,5]
      [A,E,6]
    INFILE


    @result = Djikstra::Parser.parse(in_text)
  end

  it 'should create data structure' do
    expect(@result.size).to eq 5
  end

  context 'first Edge' do
    it 'has a start node' do
      expect(@result[0].start_node).to eq 'A'
    end

    it 'has a destination node' do
      expect(@result[0].destination_node).to eq 'B'
    end

    it 'has weight' do
      expect(@result[0].weight).to eq 10
    end
  end

  context 'second edge' do
    it 'has a start node' do
      expect(@result[1].start_node).to eq 'C'
    end

    it 'has a destination node' do
      expect(@result[1].destination_node).to eq 'D'
    end

    it 'has weight' do
      expect(@result[1].weight).to eq 13
    end
  end

end