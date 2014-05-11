$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'djikstra'
require 'pry-debugger'

def build_graph(edge_text)
  edges = Djikstra::Parser.parse_edges(edge_text)
  Djikstra::Graph.new(edges)
end

