require 'spec_helper'

def should_find_route(graph, expected, from_node, to_node)
  it "should find route #{expected} for:\n#{graph}" do
    graph = build_graph graph
    expect(graph.shortest_route(from_node, to_node)).to eq(expected)
  end
end

describe 'path builder' do

  should_find_route("[A,B,1] [B,A,2]", ["A","B"], 'A', 'B')

  should_find_route(<<-TEXT, ["A","B","C"], 'A', 'C')
    [A,B,1]
    [B,C,2]
  TEXT

  should_find_route(<<-TEXT, ["A","C"], 'A', 'C')
    [A,B,2]
    [B,C,3]
    [A,C,2]
  TEXT


  should_find_route(<<-TEXT, ["A","C","D"], 'A', 'D')
    [A,B,1]
    [A,C,3]
    [B,D,8]
    [B,C,7]
    [C,D,2]
    [C,B,5]
  TEXT

  should_find_route(<<-TEXT, ["A","B","E","G"], 'A', 'G')
    [A,B,1]
    [A,C,2]
    [B,C,3]
    [B,D,3]
    [C,D,1]
    [B,E,2]
    [D,F,3]
    [D,E,3]
    [E,G,3]
    [F,G,1]
  TEXT
end

