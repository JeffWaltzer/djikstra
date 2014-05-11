require 'djikstra'
class Djikstra::Graph

  attr_accessor :nodes

  def initialize(edges)
    @nodes = {}
    edges.each { |edge| add_edge(edge) }
  end

  def [](key)
    @nodes[key]
  end

  def size
    @nodes.size
  end

  def visit_node(node)
    node.visited = true
    node.edges.each do |node_name, edge|
      next_node = @nodes[node_name]

      next_node.distance =  [ next_node.distance , node.distance + edge.weight].min
    end
  end

  def next_to_visit
    @nodes.values.reject(&:visited?).min { |n| n.distance }
  end

  private

  def add_edge(edge)
    node = nodes[edge.start_node] || Djikstra::Node.new
    nodes[edge.start_node] = node
    node.edges[edge.destination_node] = edge
    nodes[edge.destination_node] ||= Djikstra::Node.new #make sure add nodes without exits edges
  end



end
