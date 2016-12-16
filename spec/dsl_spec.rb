require "spec_helper"

describe Dsl do

   
    before :all do

        @lista_diaria1  = MenuDietetico::Lista.new()
        @lista_diaria2  = MenuDietetico::Lista.new()
        @lista_semanal  = MenuDietetico::Lista.new()

    end
   
    context "DSL" do
            it "test" do
            @menuDSL        = Dsl.new("Etiqueta") do
                            titulos      :title => "Almuerzo"
                            edades      :age => "Mayores de 30 años"
                            ingesta     :porcentaje => 35
                            plato       :description => "Sopa de fideos",
                                        :porcion => "1 1/2 cucharon",
                                        :gramos => 100
                            plato       :description => "Macarrones con queso",
                                        :porcion => "1 1/2 cucharon",
                                        :gramos => 200
                            porcentajes :vct => 785.9,
                                        :proteinas => 19,
                                        :grasas => 34,
                                        :hidratos => 47
                        end
            end
            
    end

    context "Lista diaria y semanal" do
        it "Diaria" do
            @lista_diaria1.push_final(@menuDSL)
            @lista_diaria1.push_final(@menuDSL)
            @lista_diaria1.pop_inicio
            expect(@lista_diaria1.pop_inicio).to eq(@menuDSL)
        end
        
        it "Semanal" do
            @lista_diaria1.push_final(@menuDSL)
            @lista_diaria2.push_final(@menuDSL)
            @lista_semanal.push_final(@lista_diaria1)
            @lista_semanal.push_final(@lista_diaria2)
            expect(@lista_semanal.pop_inicio.pop_inicio).to eq(@menuDSL)
            expect(@lista_semanal.pop_inicio.pop_inicio).to eq(@menuDSL)
        end
    end

end

