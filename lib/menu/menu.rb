require "menu/dieta"

module MenuDietetico

    Node = Struct.new(:value, :next, :prev)
    
    class Lista
        
        def initialize
            @head = @tail = nil
        end
        
        attr_reader :head, :tail
        
        def push_final(valor)
       
            nodo = Node.new(valor, nil, nil)
            if @head.nil? 
                @head = nodo
                @tail = nodo
            else
                @tail.next = nodo
                nodo.prev = @tail
                @tail = nodo
            end
        end
        
        def push_inicio(valor)
       
            nodo = Node.new(valor, nil, nil)
            if @head.nil? 
                @head = nodo
                @tail = nodo
            else
                nodo.next = @head
                @head = nodo
            end
        end
        
        def pop_inicio
           
            valor = @head.value
            @head = @head.next
            return valor
           
        end
        
        def pop_final
           
            valor = @tail.value
            @tail = @tail.prev
            return valor
           
        end
      
      
        
    end
    
end
