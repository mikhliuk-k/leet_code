class Node
    attr_accessor :next
    attr_accessor :prev
    attr_accessor :key
    attr_accessor :value

    # @param [Integer] key
    # @param [Integer] value
    def initialize(key, value)
        @key = key
        @value = value
    end
end

class List
    attr_accessor :head
    attr_accessor :tail
    attr_reader :nodes_count

    # @param [Integer] capacity
    def initialize(capacity)
        @nodes_count = 0
        @capacity = capacity
    end

    # @param [Node] node
    def pop_up!(node)
        return if @nodes_count < 2 || node.equal?(@head)

        node.next.prev = node.prev

        if node.equal?(@tail)
            @tail = node.next
        else
            node.prev.next = node.next
        end

        node.prev = @head
        node.next = nil
        @head.next = node
        @head = node
    end

    # @param [Node] node
    # @return [Node]
    def push_front!(node)
        if @head.nil?
            @head = @tail = node
            @nodes_count += 1
            return
        end

        node.prev = @head
        @head.next = node
        @head = node
        @nodes_count += 1

        if @nodes_count > @capacity
            evicted_node = @tail
            new_tail = @tail.next
            @tail.next = nil
            new_tail.prev = nil
            @tail = new_tail
            @nodes_count -= 1
            evicted_node
        end
    end

end

class LRUCache
    # @param [Integer] capacity
    def initialize(capacity)
        # @type [Integer, Node]
        @map = Hash.new
        @list = List.new(capacity)
    end

    # @param [Integer] key
    # @return [Integer]
    def get(key)
        if (node = @map[key])
            @list.pop_up!(node)
            node.value
        else
            -1
        end
    end

    # @param [Integer] key
    # @param [Integer] value
    def put(key, value)
        if (node = @map[key])
            node.value = value
            @list.pop_up!(node)
        else
            node = Node.new(key, value)
            @map[key] = node
            evicted_node = @list.push_front!(node)
            @map.delete(evicted_node.key) if evicted_node
        end
    end
end
