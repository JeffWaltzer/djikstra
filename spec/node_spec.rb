require 'spec_helper'


describe "Nodes" do

  before do

    edge_text =<<-EDGE_TEXT
        [A,B,1]
        [A,C,3]
        [B,D,2]
        [B,C,7]
        [C,D,2]
        [C,B,5]
    EDGE_TEXT

    edges = Djikstra::Parser.parse_edges(edge_text)

    @nodes=Djikstra::Node.build_node_hash(edges)
  end

  %w{A B C D}.each do |node_name|
    describe "Node #{node_name}" do
      before do
        @node = @nodes[node_name]
      end

      it "exists" do
        expect(@node).to be
      end

      it "has initial distance of infinity" do
        expect(@nodes[node_name].distance).to eq Float::INFINITY
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
      expect_same_array(%w(B C), @nodes['A'].edges.keys)
    end
  end
  describe 'node B' do
    it 'has edges' do
      expect_same_array(%w(C D), @nodes['B'].edges.keys)
    end
  end
  describe 'node C' do
    it 'has edges' do
      expect_same_array(%w(B D), @nodes['C'].edges.keys)
    end
  end
  describe 'node D' do
    it 'has edges' do
      expect_same_array(%w(), @nodes['D'].edges.keys)
    end
  end

  it 'has four nodes' do
    expect(@nodes.size).to eq 4
  end

  describe 'visit A' do
    before do
      @node=@nodes['A']
      @node.distance = 0 #starting node has distance of 0
      @node.visit(@nodes)
    end

    it 'is marked visited' do
      expect(@node).to be_visited
    end

    {
        'A' => 0,
        'B' => 1,
        'C' => 3,
        'D' => Float::INFINITY,
    }.each do |node_name, expected_distance|
      it "has correct distance for #{node_name}" do
        expect(@nodes[node_name].distance).to eq expected_distance
      end

    end
  end
end
