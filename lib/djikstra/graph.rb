require 'djikstra'
class Djikstra::Graph

  attr_accessor :nodes

  def initialize(edges)
    @nodes = {}
    edges.each { |edge| add_edge(edge) }
  end

  def shortest_route(from_node, to_node)
    search_graph(from_node)
    build_route(to_node)
  end

  def size
    @nodes.size
  end

  def [](key)
    @nodes[key]
  end

  def start(start_node)
    node = @nodes[start_node]
    node.distance = 0
    node.previous = nil
    node
  end

  def visit_node(node)
    node.visited = true

    node.edges.each do |node_name, edge|
      next_node = @nodes[node_name]
      if  node.distance + edge.weight < next_node.distance
        next_node.distance = node.distance + edge.weight
        next_node.previous = node.label
      end
    end

  end

  def next_to_visit
    @nodes.values.reject(&:visited?).min { |n| n.distance }
  end


  private


  def search_graph(from_node)
    node = start(from_node)
    begin
      visit_node(node)
      node = next_to_visit
    end while node
  end

  def build_route(to_node)
    route = []
    node = self[to_node]
    begin
      route.unshift node.label
      node = self[node.previous]
    end while node
    route
  end

  def add_edge(edge)
    start_node = nodes[edge.start_node] || Djikstra::Node.new(edge.start_node)
    nodes[edge.start_node] = start_node
    start_node.edges[edge.destination_node] = edge

    #make sure add nodes without exits edges
    nodes[edge.destination_node] ||= Djikstra::Node.new(edge.destination_node)
  end

end
