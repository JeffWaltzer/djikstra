class Djikstra::Parser

  def self.parse_edges(input_text)
    edges = input_text.
        scan(/\[(.*)\]+[\n\r ]/).
        flatten

    edges.map do |edge|
      arguments = edge.split(',')
      Djikstra::Edge.new(*arguments)
    end

  end
end
