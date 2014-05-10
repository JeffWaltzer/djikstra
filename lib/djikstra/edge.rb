class  Djikstra::Edge
  attr_accessor :start_node, :destination_node, :weight
  def initialize(start, destination, weight)
    self.start_node = start
    self.destination_node= destination
    self.weight = weight.to_i
  end
end