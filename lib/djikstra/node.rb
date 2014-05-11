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

end
