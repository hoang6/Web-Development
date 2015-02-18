class MyHashSet < Hash
  attr_accessor :store

  def initialize
    @store = Hash.new(false)
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store[el]
  end

  def delete(el)
    if include?(el)
      @store.delete(el)
    else
      false
    end
  end

  def to_a
    output = []
    self.store.each do |key, value|
      output << key
    end
    output
  end

  def union(set2)
    self.store.merge(set2.store)
  end

  def intersect(set2)
    output = {}
    self.store.each do |key, value|
      if set2.store.has_key?(key)
        output[key] = true
      end
    end
    output
  end

  def minus(set2)
    output = {}
    self.store.each do |key, value|
      if !set2.store.has_key?(key)
        output[key] = true
      end
    end
    output
  end

end

set1 = MyHashSet.new
set1.insert('a')

p set1.include?('a')
p set1.include?('b')
p set1.store

p set1.delete('a')

p set1.store

set1.insert('a')
set1.insert('b')


set2 = MyHashSet.new
set2.insert('a')
set2.insert('b')
set2.insert('c')

p set1.store
p set2.store

p set1.union(set2)
p set1.intersect(set2)

p set2.minus(set1)
