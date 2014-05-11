require 'spec_helper'

def should_find_route(graph_text, expected, from_node, to_node, fixnum)
  it "finds route #{expected} for:\n#{graph_text}" do
    graph = Djikstra::Graph.build graph_text
    expect(graph.shortest_route(from_node, to_node)).to eq(expected)
    expect(graph.distance(to_node)).to eq fixnum
  end

end

describe 'path builder' do

  should_find_route("[A,B,1] [B,A,2]", %w(A B), 'A', 'B', 1)

  should_find_route(<<-TEXT, %w(A B C), 'A', 'C', 3)
    [A,B,1]
    [B,C,2]
  TEXT

  should_find_route(<<-TEXT, %w(A C), 'A', 'C', 2)
    [A,B,2]
    [B,C,3]
    [A,C,2]
  TEXT

  should_find_route(<<-TEXT, %w(A C D), 'A', 'D', 5)
    [A,B,1]
    [A,C,3]
    [B,D,8]
    [B,C,7]
    [C,D,2]
    [C,B,5]
  TEXT

  should_find_route(<<-TEXT, %w(A B C D), 'A', 'D', 3)
    [A,B,1]
    [A,C,3]
    [B,C,1]
    [B,D,4]
    [C,D,1]
    [C,B,5]
  TEXT

  should_find_route(<<-TEXT, %w(A C1 C2 C3 D), 'A', 'D', 4)
    [A,B1,1]
    [A,C1,1]
    [B1,B2,1]
    [C1,C2,1]
    [C2,C3,1]
    [B2,D,3]
    [C3,D,1]
  TEXT

  should_find_route(<<-TEXT, %w(A B1 B2 D), 'A', 'D', 3)
    [A,B1,1]
    [A,C1,1]
    [B1,B2,1]
    [C1,C2,1]
    [C2,C3,1]
    [B2,D,1]
    [C3,D,3]
  TEXT

  should_find_route(<<-TEXT, %w(A C D), 'A', 'D', 2)
    [A,B,1]
    [A,C,1]
    [B,C,1]
    [B,D,4]
    [C,D,1]
    [C,B,1]
  TEXT

  should_find_route(<<-TEXT, %w(A B E G), 'A', 'G', 6)
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

