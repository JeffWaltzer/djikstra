require 'spec_helper'

describe Djikstra::CLI do

  it 'should execute from command line' do

    keep = $stdin
    begin
      $stdout = intercept = StringIO.new
      Djikstra::CLI.new.find_shortest_path("graph.txt", "A", "G")
    ensure
      $stdout = keep
    end

    expect(intercept.string).to eq "Shortest path is [A,B,E,G] with total cost 6\n"

  end
end