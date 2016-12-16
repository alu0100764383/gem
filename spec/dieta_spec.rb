require "spec_helper"

describe Dieta do
  
  before :all do
    
    platos = ["ENSALADA", "FRUTA"]
    porciones = ["PLATO", "3 PIEZAS"]
    gramos = [50,40]
    
    platos2 = ["ENSALADA", "FRUTA", "PAN"]
    porciones2 = ["PLATO", "3 PIEZAS","1 REBANADA"]
    gramos2 = [50,40,10]
    
    platos3 = ["ENSALADA", "FRUTA", "PAN"]
    porciones3 = ["PLATO", "3 PIEZAS","1 REBANADA"]
    gramos3 = [50,40,10]
    
    @menu1 = Dieta::Menu.new("MEDITERRANEA",platos,30,porciones,gramos,500,20,30,15)
    @Dieta_Por_Alimentos = GruposAlimentos.new("MEDITERRANEA",platos,30,porciones,gramos,500,20,30,15,"verduras")
    @Dieta_Por_Edad = GruposEdades.new("MEDITERRANEA",platos,30,porciones,gramos,500,20,30,15,"20 A 30 AÑOS")
    
    @menu2 = Dieta::Menu.new("MEDITERRANEA",platos2,30,porciones2,gramos2,500,20,30,15)
    @menu3 = Dieta::Menu.new("MEDITERRANEA",platos3,30,porciones3,gramos3,500,20,30,15)
     
    puts "\n" + @Dieta_Por_Alimentos.to_s + "\n"
    puts "\n" + @Dieta_Por_Edad.to_s + "\n"
    
  end
  
  context "Comprobando requisitos de la clase dieta" do
    
    it "Debe tener un titulo" do
      expect(@menu1.titulo).to_not be_empty
    end
    
    it "Debe tener la ingesta diaria que representa" do
      expect(@menu1.porcentaje).to be_between(1, 100)
    end
    
    it "Debe tener la descripcion del plato" do
      @menu1.platos.each do |a|
        expect(a).to_not be_empty
      end
    end
    
    it "Debe tener la porcion recomendada del plato" do
      @menu1.porcion.each do |a|
        expect(a).to_not be_empty
      end
    end
    
    it "Debe tener la ingesta en gramos de un plato" do
      @menu1.ingesta.each do |a|
        expect(a).to_not be < 0
      end
    end
    
    it "Debe tener un valor calorico total" do 
      expect(@menu1.vct).to_not be < 0
    end

    it "Debe tener el porcentaje de proteinas de un conjunto de platos" do
      expect(@menu1.proteinas).to be_between(1, 100)
    end
    
    it "Debe tener el porcentaje de grasas de un conjunto de platos" do 
      expect(@menu1.grasas).to be_between(1, 100)
    end
    
    it "Debe tener el porcentaje de hidratos de carbono de un conjunto de platos" do
      expect(@menu1.hidratos).to be_between(1, 100)
    end
    
    it "Debe contener un metodo que devuelva la salida formateada" do
      expect(@menu1.to_s).to_not be_empty
    end
  end
  
  describe "Comprobando requisitos de la herencia " do
  it "La clase Por_Alimentos hereda de Dieta" do
    expect(@Dieta_Por_Alimentos).instance_of?(Menu)
  end
  
  it "La clase Por_Edad hereda de Dieta" do
    expect(@Dieta_Por_Edad).instance_of?(Menu)
  end
  
  it "La clase Por_Edad pertenece tanto a Por_Edad como a Dieta" do
    expect(@Dieta_Por_Edad).to be_a(GruposEdades)
    expect(@Dieta_Por_Edad).to be_a(Dieta::Menu)
  end
  
  it "La clase Por_Alimentos pertenece tanto a Por_Alimentos como a Dieta" do
    expect(@Dieta_Por_Alimentos).to be_a(GruposAlimentos)
    expect(@Dieta_Por_Alimentos).to be_a(Dieta::Menu)
  end
end

describe "Comprobando requisitos de la comparacion" do
  
  it "Prueba 1: menu1 < menu2" do
    expect(@menu1 < @menu2).to eq(true)
  end
  
  it "Prueba 2: menu2 > menu1" do
    expect(@menu2 > @menu1).to eq(true)
  end
  
  it "Prueba 3: menu2 = menu3" do
    expect(@menu2 == @menu3).to eq(true)
  end
  
end

end

