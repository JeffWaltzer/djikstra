class Djikstra::Parser

  def self.parse(input_text)
    edges = input_text.
        scan(/\[(.*)\]+/).
        flatten

    edges.map do |edge|
      arguments = edge.split(',')
      Djikstra::Edge.new(*arguments)
    end

  end
end
