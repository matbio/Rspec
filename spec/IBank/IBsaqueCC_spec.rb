require_relative '..\..\app\ContaIBank'

describe ContaCorrente do
  describe "Saques" do
    context "Quando Saque com saldo positvo" do
      #Ao utilizar o before ele não permite uso da variavel objeto como uma instacia, necessário adicionar o @ para utilizar a variavel no expect
      before(:all) do
        @contac = ContaCorrente.new(1000.00)
        @contac.sacar(200.00)
      end
      it "Então atualizar saldo após saque" do
        expect(@contac.Saldo).to eql(800.00)
      end
    end

    context "Quando saque com saldo igual a 0" do
      before(:all) do
        @contac = ContaCorrente.new(0.00)
        @contac.sacar(100.00)
      end
      it "Então manter saldo inicial" do
        expect(@contac.Saldo).to eql(0.00)
      end
      it "E mostrar mensagem de saldo insuficiente" do
        expect(@contac.Mensagem).to eql("Saldo insuficiente para saque :(")
      end
    end
    context "Quando saque com saldo insulficiente" do
      before(:all) do
        @contac = ContaCorrente.new(500.00)
        @contac.sacar(501.00)
      end
      it "Então manter saldo inicial" do
        expect(@contac.Saldo).to eql(500.00)
      end
      it "E mostrar mensagem de saldo insuficiente" do
        expect(@contac.Mensagem).to eql("Saldo insuficiente para saque :(")
      end
    end
    context "Quando Saque que ultrapassa o limite" do
      before(:all) do
        @contac = ContaCorrente.new(1000.00)
        @contac.sacar(701.00)
      end
      it "Então manter saldo inicial" do
        expect(@contac.Saldo).to eql(1000.00)
      end
      it "E mostrar mensagem de Limite de saque" do
        expect(@contac.Mensagem).to eql("Limite máximo por saque é de R$ 700")
      end
    end
  end
end
