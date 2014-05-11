require 'spec_helper'

def nodes_should_have_values(expected_node_values)
  expected_node_values.each do |node_name, expected_distance|
    it "has correct distance for #{node_name}" do
      expect(@graph[node_name].distance).to eq expected_distance
    end

  end
end

describe "Nodes" do

  before do

    edge_text =<<-EDGE_TEXT
          [A,B,1]
          [A,C,3]
          [B,D,8]
          [B,C,7]
          [C,D,2]
          [C,B,5]
    EDGE_TEXT

    edges = Djikstra::Parser.parse_edges(edge_text)

    @graph=Djikstra::Graph.new(edges)
  end

  %w{A B C D}.each do |node_name|
    describe "Node #{node_name}" do
      before do
        @node = @graph[node_name]
      end

      it 'exists' do
        expect(@node).to be
      end

      it 'has initial distance of infinity' do
        expect(@graph[node_name].distance).to eq Float::INFINITY
      end

      it 'has no previous node yet' do
        expect(@node.previous).to be_nil
      end

      it 'has not been visited yet' do
        expect(@node.visited?).to eq false
      end
    end
  end

  describe 'node A' do
    it 'has edges' do
      expect(@graph['A'].edges.keys.sort).to eq %w(B C)
    end
  end
  describe 'node B' do
    it 'has edges' do
      expect(@graph['B'].edges.keys.sort).to eq %w(C D)
    end
  end
  describe 'node C' do
    it 'has edges' do
      expect(@graph['C'].edges.keys.sort).to eq %w(B D)
    end
  end
  describe 'node D' do
    it 'has edges' do
      expect(@graph['D'].edges.keys.sort).to eq []
    end
  end

  it 'has four nodes' do
    expect(@graph.size).to eq 4
  end

  describe 'visit A' do
    before do
      @node=@graph['A']
      @node.distance = 0 #starting node has distance of 0
      @graph.visit_node(@node)
    end

    it 'is marked visited' do
      expect(@node).to be_visited
    end

    nodes_should_have_values(
        {
            'A' => 0,
            'B' => 1,
            'C' => 3,
            'D' => Float::INFINITY,
        })

    it 'picks next to visit' do
      expect(@graph.next_to_visit).to eq(@graph['B'])
    end

    context 'and then visit 2nd node' do
      before do
        @next_node = @graph.next_to_visit
        @graph.visit_node(@next_node)
      end

      nodes_should_have_values(
          {
              'A' => 0,
              'B' => 1,
              'C' => 3,
              'D' => 9,
          })

      it 'marks next node as visited' do
        expect(@next_node).to be_visited
      end

      it 'picks next to visit' do
        expect(@graph.next_to_visit).to eq(@graph['C'])
      end

      context 'and then visit 3rd node' do
        before do
          @next_node = @graph.next_to_visit
          @graph.visit_node(@next_node)
        end

        nodes_should_have_values(
            {
                'A' => 0,
                'B' => 1,
                'C' => 3,
                'D' => 5,
            })

        it 'marks next node as visited' do
          expect(@next_node).to be_visited
        end

        it 'picks next to visit' do
          expect(@graph.next_to_visit).to eq(@graph['D'])
        end


        context 'and then visit 4th node' do
          before do
            @next_node = @graph.next_to_visit
            @graph.visit_node(@next_node)
          end

          nodes_should_have_values(
              {
                  'A' => 0,
                  'B' => 1,
                  'C' => 3,
                  'D' => 5,
              })

          it 'marks next node as visited' do
            expect(@next_node).to be_visited
          end

          it 'picks next to visit' do
            expect(@graph.next_to_visit).to be_nil
          end

        end
      end
    end
  end
end
