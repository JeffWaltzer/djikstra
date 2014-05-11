class Djikstra::Graph

  attr_accessor :nodes

  def initialize
    @nodes = {}
  end


  def next_to_visit

  end


  def add_nodes(edge)
    node = nodes[edge.start_node] || Djikstra::Node.new
    nodes[edge.start_node] = node
    node.edges[edge.destination_node] = edge
    nodes[edge.destination_node] ||= Djikstra::Node.new #make sure add nodes without exits edges
  end


  def visit_node( node)
    node.visited = true
    node.edges.each do |node_name, edge|
      next_node = @nodes[node_name]
      next_node.distance = edge.weight
    end
  end


  def [] key
    @nodes[key]
  end

  def size
    @nodes.size
  end

  def self.build(edges)
    graph = Djikstra::Graph.new
    edges.each do |edge|
      graph.add_nodes(edge)
    end
    graph
  end

end
