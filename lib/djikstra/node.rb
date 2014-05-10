class Djikstra::Node
  attr_accessor :distance, :previous, :edges, :visited

  def initialize
    self.distance = Float::INFINITY
    self.visited = false
    self.edges = {}
  end

  def visited?
    self.visited
  end

  def visit(nodes)
    self.visited = true
    edges.each do |node_name, edge|
      next_node = nodes[node_name]
      next_node.distance = edge.weight
    end
  end

  def self.build_node_hash(edges)
    nodes = {}
    edges.each do |edge|
      node = nodes[edge.start_node] || Djikstra::Node.new
      nodes[edge.start_node] = node
      node.edges[edge.destination_node] = edge
      nodes[edge.destination_node] ||= Djikstra::Node.new  #make sure add nodes without exits edges
    end
    nodes
  end
end
