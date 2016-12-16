require "spec_helper"

describe MenuDietetico do
  
  before :all do
    
    platos = ["LECHE DESNATADA", "CACAO INSTANTANEO", "CEREALES DE DESAYUNO EN HOJUELAS", "ALMENDRAS LAMINADAS"]
    porciones = ["1 VASO", "1 C SOPERA", "1 BOL PEQUEÑO", "2 C SOPERAS"]
    gramos = [100,10,40,10]
    
    @menu1 = Dieta::Menu.new("DESAYUNO",platos,15,porciones,gramos,288,17,21,62)
    
        platos = ["CEREALES", "GALLETAS BIFIDUS"]
    porciones = ["10-12 UNIDADES", "4 UNIDADES"]
    gramos = [120,40]
    
    @menu2 = Dieta::Menu.new("MEDIA MAÑANA",platos,10,porciones,gramos,255,7,24,69)
    
        platos = ["MACARRONES", "ESCALOPE DE TERNERA", "ENSALADA BASICA", "MANDARINA", "PAN"]
    porciones = ["1 CUCHARON", "1 BISTEC MEDIANO", "GUARNICION", "1 GRANDE", "1 RODAJA"]
    gramos = [200,100,120,180,20]
    
    @menu3 = Dieta::Menu.new("ALMUERZO",platos,30,porciones,gramos,785,10,30,60)
    
        platos = ["GALLETAS DE LECHE", "FLAN DE VAINILLA"]
    porciones = ["4 UNIDADES", "1 UNIDAD"]
    gramos = [46,110]
    
    @menu4 = Dieta::Menu.new("MERIENDA",platos,15,porciones,gramos,313,10,30,60)
    
        platos = ["CREMA DE BUBANGO", "TORTILLA CAMPESINA", "TOMATE EN DADOS CON ATUN", "PIÑA", "PAN"]
    porciones = ["2 CUCHARONES", "1 CUÑA GRANDE", "5 C SOPERAS", "5 C SOPERAS", "1 RODAJA"]
    gramos = [200,150,150,120,20]
    
    @menu5 = Dieta::Menu.new("CENA",platos,30,porciones,gramos,561,19,40,41)
    
     platos = ["CREMA DE BUBANGO", "TORTILLA DE ZANAHORIA", "TOMATE EN DADOS CON ACEITE", "PIÑA", "PAN"]
    porciones = ["2 CUCHARONES", "1 CUÑA GRANDE", "3 UNIDADES", "1 UNIDAD", "1 RODAJA"]
    gramos = [200,150,150,120,20]
    
    @menualimentos = GruposAlimentos.new("Vegetariano",platos,20,porciones,gramos,333,30,20,50,"verduras kappa")
    
    @menuedades = GruposEdades.new("Edades",platos,20,porciones,gramos,333,30,20,50,"20 a 30 años")
    
    
    #puts "\n" + @menu1.to_s + "\n"
    #puts "\n" + @menu2.to_s + "\n"
    #puts "\n" + @menu3.to_s + "\n"
    #puts "\n" + @menu4.to_s + "\n"
    #puts "\n" + @menu5.to_s + "\n"
    #puts "\n" + @menualimentos.to_s + "\n"
    #puts "\n" + @menuedades.to_s + "\n"
    
    @lista = MenuDietetico::Lista.new
    
    @lista.push_final(@menu1)
    @lista.push_final("hola")
    
  end

  context "Requisitos del Nodo" do
    
    it "Debe existir un Nodo de la lista con sus datos y su siguiente" do
      expect(@lista.head).to_not be_nil
      expect(@lista.head.value).to_not be_nil
      expect(@lista.head.next).to_not be_nil
      @lista.pop_inicio
      
    end
    
  end
    
  context "Requisios de la Lista" do
    
    it "Debe existir una lista con su cabeza" do 
      expect(@lista.head).to_not be_nil
    end
    
    
    it "Se puede extraer el primer elemento de la lista" do
      prueba = @lista.head.value
      expect(@lista.pop_inicio).to eq(prueba)
    end
    
    it "Se puede insertar un elemento" do
      @lista.push_final(@menu1)
      expect(@lista.pop_inicio).to eq(@menu1)
    end
    
    it "Se pueden insertar varios elementos" do
      @lista.push_final(@menu1)
      @lista.push_final(@menu2)
      @lista.push_final(@menu3)
      @lista.push_final(@menu4)
      @lista.push_final(@menu5)
      expect(@lista.pop_inicio).to eq(@menu1)
      expect(@lista.pop_inicio).to eq(@menu2)
      expect(@lista.pop_inicio).to eq(@menu3)
      expect(@lista.pop_inicio).to eq(@menu4)
      expect(@lista.pop_inicio).to eq(@menu5)
    end
    
  end
  
  context "Requisios de el modulo Enumerable" do
    
    it "Puede revertir los menus de la lista" do
      @lista.push_final(@menu1)
      @lista.push_final(@menu2)
      @lista2 = @lista.reverse
      expect(@lista.head.value).to eq(@lista2.tail.value)
      
    end
    
    it "Puede encontrar un elemento" do
      
      expect(@lista.find { |menu| menu==@menu1 }).to eq(@menu1)
      
    end
    
  
  end

end


