module Dieta

  class Menu
    
    include Comparable
    
    def initialize(titulo, platos, porcentaje, porcion, ingesta, vct, proteinas, grasas, hidratos)
      @titulo = titulo #Nombre del plato
      @porcentaje = porcentaje #Porcentaje que representa el menu en la ingesta diaria
      @vct= vct #Valor calorico total del menu
      @proteinas= proteinas #porcentaje de proteinas total del menu
      @grasas= grasas #porcentaje de grasas total del menu
      @hidratos= hidratos #porcentaje de hidratos de carbono total del menu
      @platos= platos #array de los nombres de los platos
      @porcion= porcion #array con las porciones recomendadas de cada plato. se corresponde 1 a 1 con el array de platos
      @ingesta= ingesta #array con las cantidades en gramos de cada plato. se corresponde 1 a 1 con el array de platos 
    end

    attr_reader :titulo, :porcentaje, :vct, :proteinas, :grasas, :hidratos, :platos, :porcion, :ingesta

    def to_s()
      out = "#{titulo} (#{porcentaje}%)\n"
      i=0
      while i<@platos.size
        out = out + "- #{platos[i]}, #{porcion[i]}, #{ingesta[i]}\n"
        i = i+1
      end
      out = out + "V.C.T. | #{vct} | #{proteinas}% - #{grasas}% - #{hidratos}%\n"
      return out
    end
    
    def <=>(other)                                              #funcion necesaria para comparar (COMPARABLE)
        self.platos.size() <=> other.platos.size()
    end
    
  end
end

