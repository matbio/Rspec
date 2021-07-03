class Conta
  attr_accessor :Saldo, :Mensagem

  def initialize(saldo)
    self.Saldo = saldo
    self.Mensagem = ""
  end

  def sacar(saque, limite)
    if saque <= limite
      if self.Saldo >= saque
        self.Saldo = self.Saldo - saque
        self.Mensagem = "Seu saldo final ficou: R$ #{self.Saldo}, Após seu saque de: R$ #{saque}"
      else
        self.Mensagem = "Saldo insuficiente para saque :("
      end
    else
      self.Mensagem = "Limite máximo por saque é de R$ #{limite}"
    end
  end
end

class ContaCorrente < Conta
  def sacar(saque, limite = 700)
    super
  end
end

class ContaPoupanca < Conta
  def sacar(saque, limite = 500)
    super
  end
end
