require_relative '..\..\app\ContaIBank'

describe ContaPoupanca do
  describe "Saques" do
    context "Quando Saque com saldo positvo" do
      #Ao utilizar o before ele não permite uso da variavel objeto como uma instacia, necessário adicionar o @ para utilizar a variavel no expect
      before(:all) do
        @contap = ContaPoupanca.new(1000.00)
        @contap.sacar(200.00)
      end
      it "Então atualizar saldo após saque" do
        expect(@contap.Saldo).to eql(800.00)
      end
    end

    context "Quando saque com saldo igual a 0" do
      before(:all) do
        @contap = ContaPoupanca.new(0.00)
        @contap.sacar(100.00)
      end
      it "Então manter saldo inicial" do
        expect(@contap.Saldo).to eql(0.00)
      end
      it "E mostrar mensagem de saldo insuficiente" do
        expect(@contap.Mensagem).to eql("Saldo insuficiente para saque :(")
      end
    end
    context "Quando saque com saldo insulficiente" do
      before(:all) do
        @contap = ContaPoupanca.new(400.00)
        @contap.sacar(401.00)
      end
      it "Então manter saldo inicial" do
        expect(@contap.Saldo).to eql(400.00)
      end
      it "E mostrar mensagem de saldo insuficiente" do
        expect(@contap.Mensagem).to eql("Saldo insuficiente para saque :(")
      end
    end
    context "Quando Saque que ultrapassa o limite" do
      before(:all) do
        @contap = ContaPoupanca.new(1000.00)
        @contap.sacar(701.00)
      end
      it "Então manter saldo inicial" do
        expect(@contap.Saldo).to eql(1000.00)
      end
      it "E mostrar mensagem de Limite de saque" do
        expect(@contap.Mensagem).to eql("Limite máximo por saque é de R$ 500")
      end
    end
  end
end
