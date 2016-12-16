require "menu/gruposedades"
require "menu/dieta"

class Dsl < GruposEdades

        def initialize(tag, &block)
            
            super()

            if block_given?
                if block.arity == 1
                    yield self
                else
                    instance_eval(&block)
                end
            end
        end

        def titulos(options = {})
            @titulo = options[:title]
        end
        
        def edades(options = {})
            @grupo = options[:age]
        end
        
        def ingesta(options = {})
            @porcentaje = options[:porcentaje]
            
        end

        def plato(options = {})
            
            @platos = []
            @porcion = []
            @ingesta = []
            
            @platos << options[:description]
            @porcion << options[:porcion]
            @ingesta << options[:gramos]

        end

        def porcentajes(options = {})
            @vct = options[:vct]
            @proteinas = options[:proteinas]
            @grasas = options[:grasas]
            @hidratos = options[:hidratos]
        end
        

end
