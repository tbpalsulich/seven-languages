# Many thanks to the users at http://forums.pragprog.com/forums/147/topics/7077.

class Tree
	attr_accessor :children, :node_name, :depth
	def initialize(hash={}, depth = 0)
		@depth = depth
		@children = []
		hash.each do |name, children|
			@node_name = name
			children.each do |cName, cChildren|
				@children.push(Tree.new({cName => cChildren}, @depth + 2))
			end
		end
	end
	def visit_all(&block)
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

