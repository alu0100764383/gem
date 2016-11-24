require "spec_helper"

describe Dieta do
  
  before :all do
    
    platos = ["ENSALADA", "FRUTA"]
    porciones = ["PLATO", "3 PIEZAS"]
    gramos = [50,40]
    
    @dieta = Dieta::Menu.new("MEDITERRANEA",platos,30,porciones,gramos,500,20,30,15)
    @Dieta_Por_Alimentos = GruposAlimentos.new("MEDITERRANEA",platos,30,porciones,gramos,500,20,30,15,"verduras")
    @Dieta_Por_Edad = GruposEdades.new("MEDITERRANEA",platos,30,porciones,gramos,500,20,30,15,"20 A 30 AÑOS")
    
     puts "\n" + @dieta.to_s + "\n"
    puts "\n" + @Dieta_Por_Alimentos.to_s + "\n"
   puts "\n" + @Dieta_Por_Edad.to_s + "\n"
    
  end
  
  context "Comprobando requisitos de la clase dieta" do
    
    it "Debe tener un titulo" do
      expect(@dieta.titulo).to_not be_empty
    end
    
    it "Debe tener la ingesta diaria que representa" do
      expect(@dieta.porcentaje).to be_between(1, 100)
    end
    
    it "Debe tener la descripcion del plato" do
      @dieta.platos.each do |a|
        expect(a).to_not be_empty
      end
    end
    
    it "Debe tener la porcion recomendada del plato" do
      @dieta.porcion.each do |a|
        expect(a).to_not be_empty
      end
    end
    
    it "Debe tener la ingesta en gramos de un plato" do
      @dieta.ingesta.each do |a|
        expect(a).to_not be < 0
      end
    end
    
    it "Debe tener un valor calorico total" do 
      expect(@dieta.vct).to_not be < 0
    end

    it "Debe tener el porcentaje de proteinas de un conjunto de platos" do
      expect(@dieta.proteinas).to be_between(1, 100)
    end
    
    it "Debe tener el porcentaje de grasas de un conjunto de platos" do 
      expect(@dieta.grasas).to be_between(1, 100)
    end
    
    it "Debe tener el porcentaje de hidratos de carbono de un conjunto de platos" do
      expect(@dieta.hidratos).to be_between(1, 100)
    end
    
    it "Debe contener un metodo que devuelva la salida formateada" do
      expect(@dieta.to_s).to_not be_empty
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
end