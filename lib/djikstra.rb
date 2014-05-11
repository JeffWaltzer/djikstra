require "djikstra/version"
require "djikstra/parser"
require "djikstra/edge"
require "djikstra/node"
require "djikstra/graph"
require 'pry'

module Djikstra
  class CLI

    def run
      if ARGV.size < 3
        puts "Missing command line arguments\n$ djikstra {graph_filename} {start} {end}"
      else
        find_shortest_path(*ARGV)
      end
    end

    def find_shortest_path(file_name, from_node, to_node)
      edge_text = File.read(file_name)
      from_node = from_node
      to_node = to_node

      graph = Djikstra::Graph.build(edge_text)

      route = graph.shortest_route(from_node, to_node)
      distance = graph.distance(to_node)

      puts "Shortest path is [#{route.join(',')}] with total cost #{distance}"
    end

  end
end
