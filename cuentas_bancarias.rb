#Ejercicio 1
class CuentaBancaria
    attr_accessor :saldo
    attr_reader :banco, :numero_de_cuenta

    def initialize(banco, numero_de_cuenta, saldo = 0.0)
        raise ArgumentError, "Numero de cuenta solo debe contener numeros" if (numero_de_cuenta.to_i != Numeric)
        @banco = banco
        @numero_de_cuenta = numero_de_cuenta
        @saldo = saldo
    end

    def transferir(monto, cuenta)
        raise "\nATENCION\n Su saldo en la cuenta #{@numero_de_cuenta} es insuficiente \npara realizar esta transaccion" if (monto > @saldo)
        @saldo -= monto
        cuenta.saldo += monto
        monto
    end
end

class Usuario
    attr_reader :nombre, :cuentas

    def initialize(nombre, cuentas)
        @nombre = nombre
        @cuentas = []

        if (cuentas.class != Array)
            @cuentas.push(cuentas)
        else
            cuentas.each do |cuenta|
                @cuentas.push(cuenta)
            end
        end
    end

    def saldo_total()
        @cuentas.inject(0) do |total, cuenta|
            total += cuenta.saldo
        end
        
    end
end

cuenta1 = CuentaBancaria.new('Elite',12345,5000)
cuenta2 = CuentaBancaria.new('Pro',6789,5000)
cuenta3 = CuentaBancaria.new('Diamond',765456,5000)

user1 = Usuario.new('Jorge',cuenta1)
user2 = Usuario.new('Miguel',cuenta2)

puts user1.saldo_total
puts user2.saldo_total

puts "Transferencia"

user1.cuentas[0].transferir(user1.saldo_total, user1.cuentas[0])

puts user1.saldo_total
puts user2.saldo_total
