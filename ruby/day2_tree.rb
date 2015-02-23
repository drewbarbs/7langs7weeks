#!/usr/bin/env ruby

class Tree
  attr_accessor :name, :children

  def initialize(name, children=[])
    @name = name
    @children = children
    @children = children.map {|n, c| Tree.new(n,c) } if children.is_a? Hash
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

t = Tree.new('a', [Tree.new('b', []), Tree.new('c', [])])
t.visit_all {|n| puts n.name}

t = Tree.new('a', {'b'=>{'b1'=>{}, 'b2'=>{}}, 'c'=>{}})
t.visit_all {|n| puts n.name}
