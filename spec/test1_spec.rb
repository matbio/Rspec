class Feira
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(item)
    self.list.push(item)
  end
end

#TDD guiado por testes
#Validador eql (Verifica a tipagem tbm)
describe Feira do
  it "Deve adicionar um tipo de fruta" do
    frutas = Feira.new
    frutas.put("Banana")
    expect(frutas.list).to eql ["Banana"]
  end

  #Validador include verifica a existencia em uma lista
  #Validador  to be (Permite impor uma condição)
  it "Deve adicionar uma lista de frutas" do
    frutas = Feira.new
    frutas.put("Mamão")
    frutas.put("Laranja")
    frutas.put("Melão")

    res = frutas.list.size > 0

    expect(frutas.list).to include "Laranja"
    expect(frutas.list.size).to be > 0
    expect(res).to be true
  end

  #Validador start_with verifica se a lista começa com o item citado
  it "Mamão deve ser o primeiro da lista de frutas" do
    frutas = Feira.new
    frutas.put("Mamão")
    frutas.put("Laranja")
    frutas.put("Melão")

    expect(frutas.list).to start_with "Mamão"
  end

  #Validador end_with verifica se a lista termina com o item citado
  it "Melão deve ser o ultimo da lista de frutas" do
    frutas = Feira.new
    frutas.put("Mamão")
    frutas.put("Laranja")
    frutas.put("Melão")

    expect(frutas.list).to end_with "Melão"
  end

  #Validador match verifica se em almuga parte a o trecho correspondente
  it "Deve conter o sobrenome do feirante" do
    feirante = "Luis Souza"

    expect(feirante).to match(/Souza/)
    expect(feirante).not_to match(/Vieira/)
  end
end

# ----- Validadores matchers de true e false -----
# passa se obj é truthy (não nil ou não false)
#  expect(obj).to be_true
# passa se obj é falsy (nil ou false)
#  expect(obj).to be_false
# passa se obj é nil
#  expect(obj).to be_nil
# passa se obj é truthy (não nil e não false)
#  expect(obj).to be_truthy

# ----- Validadores matchers de equidade -----
# expect(a).to equal(b) # passa se a.equal?(b)
# expect(a).to be(b)    # passa se a.equal?(b)
# expect(a).to eql(b)   # passa se a.eql?(b)
# expect(a).to eq(b)    # passa se a == b

# ----- Validadores matchers de arrays -----
#array = [1, 2, 3, 4]
#expect(array).to match_array([1, 2, 3, 4])
#expect(array).to match_array([4, 3, 2, 1])
#expect(array).not_to match_array([1, 2, 3])
#expect(array).not_to match_array([1, 2, 3, 4, 5])

#expect(array).to include(1)
#expect(array).to include(1, 2, 3)
#expect(array).to include(1, 2, 3, 4)
#expect(array).not_to include(0)
#expect(array).not_to include(5)
#expect(array).not_to include(5, 6, 7, 8)
#expect(array).not_to include([1, 2, 3, 4])

#expect(array).to start_with(1)
#expect(array).to start_with(1, 2)
#expect(array).not_to start_with(2)
#expect(array).not_to end_with(3)
#expect(array).to end_with(4)
#expect(array).to end_with(3, 4)

# ----- Validadores matchers de strings -----
#string = "qa ninja"
#expect(string).to match(/qa/)
#expect(string).to match(/inja/)
#expect(string).not_to match(/ka/)
#expect(string).not_to match(/qaninja/)
#
#expect(string).to include("q")
#expect(string).to include("qa")
#expect(string).to include("qa", "ninja")
#expect(string).not_to include("ka")
#expect(string).not_to include("ninjas")
#
#expect(string).to start_with("qa")
#expect(string).not_to start_with("ninja")
#expect(string).to end_with("ninja")
#expect(string).not_to end_with("qa")
