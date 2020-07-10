class Vertex
  attr_accessor :color, :d, :pi, :adj_list, :key, :attribute, :f

  def initialize(color, d, pi, adj_list=[], attribute)
    @color, @d, @pi, @adj_list, @attribute= color, d, pi, adj_list, attribute
  end
end

# TODO: Create a new class GenericVertex to avoid multiple definitions of Vertex
class MSTVertex
  attr_accessor :d, :key, :pi, :adj_list, :set_pointer, :next_pointer

  def initialize(key, set_pointer, next_pointer)
    @key, @set_pointer, @next_pointer = key, set_pointer, next_pointer
  end
end

class MSTPrimVertex
  include Comparable

  attr_accessor :d, :key, :pi, :adj_list

  def <=> (anotherVertex)
    key <=> anotherVertex.key
  end

  def initialize(d, key, pi, adj_list)
    @d, @key, @pi, @adj_list = d, key, pi, adj_list
  end

  def belongs_to?(vertex_list)
    vertex_list.each do |x|
      return true if self.equal?(x)
    end
    return false
  end
end

class Edge
  attr_accessor :v1, :v2, :w

  def initialize(v1, v2)
    @v1, @v2 = v1, v2
  end
end

# TODO: Create a new class GenericEdge to avoid multiple definitions of Edge
class MSTEdge
  attr_accessor :v1, :v2, :w

  def initialize(v1, v2, w)
    @v1, @v2, @w = v1, v2, w
  end
end

class Graph
  attr_accessor :vertices, :edges

  def initialize(edges)
    @edges = edges
    @vertices = build_vertices(edges)
  end

  def initialize(vertices, edges)
    @vertices, @edges = vertices, edges
  end

  def find(attribute)
    @vertices.select { |v| v.attribute == attribute }.first
  end

  def get_adjacency_list(vertex)
    vertex.adj_list
  end

  def add_vertex(vertex)
    @vertices << vertex
  end

  def add_edge(edge)
    edge.v1.adj_list << edge.v2
    edge.v2.adj_list << edge.v1
  end

  def add_edge(v1, v2)
    @edges << Edge.new(v1, v2)
    v1.adj_list << v2
    v2.adj_list << v1
  end

  def get_edge_weight(v1, v2)
    @edges.each do |edge|
      if ((edge.v1).equal?(v1) && (edge.v2).equal?(v2)) || ((edge.v1).equal?(v2) && (edge.v2).equal?(v1))
        return edge.w
      end
    end
    return 0
  end

  private
  def build_vertices(edges)
    vertices = []
    edges.each do |x|
      vertices << x.v1
      vertices << x.v2
    end
    vertices.uniq
  end
end
