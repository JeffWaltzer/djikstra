class Djikstra::Node
  attr_accessor :label, :distance, :previous, :edges, :visited

  def initialize(label)
    self.label=label
    self.distance = Float::INFINITY
    self.visited = false
    self.edges = {}
  end

  def visited?
    self.visited
  end

end