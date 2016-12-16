require "menu/dieta"

module MenuDietetico

    Node = Struct.new(:value, :next, :prev)
    
    class Lista
        
        include Enumerable
        
        def initialize
            @head = @tail = nil
            @size = 0
        end
        
        attr_reader :head, :tail
        
        def push_final(valor)
       
            nodo = Node.new(valor, nil, nil)
            if @head.nil? 
                @head = nodo
                @tail = nodo
                @size = @size + 1
            else
                @tail.next = nodo
                nodo.prev = @tail
                @tail = nodo
                @size = @size + 1
            end
        end
        
        def push_inicio(valor)
       
            nodo = Node.new(valor, nil, nil)
            if @head.nil? 
                @head = nodo
                @tail = nodo
                @size = @size + 1
            else
                nodo.next = @head
                @head = nodo
                @size = @size + 1
            end
        end
        
        def pop_inicio
           
            valor = @head.value
            @head = @head.next
            @size = @size - 1
            return valor
            
           
        end
        
        def pop_final
           
            valor = @tail.value
            @tail = @tail.prev
            @size = @size - 1
            return valor
           
        end
        
        def each
            
            return nil if @head.nil?
            
            aux = @head
            
            until aux.nil?
                yield aux.value
                aux = aux.next
                
            end
            
        end
        
        def reverse
        
            new_list = Lista.new
            self.each {|entry| new_list.push_inicio(entry)}
            return new_list
        
        end
        
    end
    
end
