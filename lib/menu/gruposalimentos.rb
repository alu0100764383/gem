require "menu/dieta"

class GruposAlimentos < Dieta::Menu
    
    include Comparable
    attr_reader :grupo
    def initialize(*args)
        super(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8])
        @grupo = args[9]
    end
    def to_s
        "#{@grupo}\n #{super}"
    end
end