# Tyler Palsulich
# Seven Languages in Seven Weeks, by Bruce A. Tate
# Ruby Day 2


# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child
# 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }

# Many thanks to the users at http://forums.pragprog.com/forums/147/topics/7077.

class Tree
	attr_accessor :children, :node_name, :depth
	def initialize(hash={}, depth = 0) # Depth is just used for pretty printing.
		@depth = depth
		@children = []
		hash.each do |name, children|
			@node_name = name
			children.each do |cName, cChildren|
				@children.push(Tree.new({cName => cChildren}, @depth + 2)) # Build a new Tree node for every Child.
			end
		end
	end
	def visit_all(&block) # Visit this block, then visit all of its children.
		visit &block
		@children.each {|child| child.visit_all &block}
	end
	def visit(&block)
		block.call self
	end
end

family_tree = Tree.new({'Grandpa' =>{
				'Dad' => {
					'Me!' => {}, 
					'Brother' => {}
				}, 'Uncle' => {
					'Cousin 1' => {}, 
					'Cousin 2' => {}
				}
			}})

puts "Visiting a node"
family_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
family_tree.visit_all {|node| puts "#{' ' * node.depth} #{node.node_name}"}

