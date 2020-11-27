#Ejercicio 1

class CuentaBancaria
    attr_accessor :saldo
    attr_reader :banco, :numero_de_cuenta

    def initialize(banco, numero_de_cuenta, saldo = 0.0)
        raise ArgumentError, "Numero de cuenta solo debe contener numeros" if (numero_de_cuenta.count('a-z') > 0 || numero_de_cuenta.count('A-Z') > 0)
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

#Valores de prueba
bd_cuentas = [CuentaBancaria.new('Elite','12345',5000), 
              CuentaBancaria.new('Pro','6789',5000), 
              CuentaBancaria.new('Diamond','765456',5000)]

bd_usuarios = [Usuario.new('Jorge', bd_cuentas[0]), 
               Usuario.new('Miguel', [bd_cuentas[1], bd_cuentas[2]])]


puts "Cuentas de prueba"
bd_cuentas.count.times do |i|
    puts "Cuenta #{i+1}: #{bd_cuentas[i].banco} - Nº #{bd_cuentas[i].numero_de_cuenta} - Saldo Actual: #{bd_cuentas[i].saldo}"    
end

puts "\nUsuarios de prueba"
bd_usuarios.count.times do |i|
    puts "Usuario #{i+1}: #{bd_usuarios[i].nombre} \nCuentas:"
    bd_usuarios[i].cuentas.each do |cuenta_test|
        puts "#{cuenta_test.banco} - Nº #{cuenta_test.numero_de_cuenta} - Saldo Actual #{cuenta_test.saldo}"
    end
    puts "\n"
end

puts "Saldo Total"
bd_usuarios.each do |usuario_test|
    puts "Usuario: #{usuario_test.nombre} - #{usuario_test.saldo_total}"
end

puts "\nTransferencia"
puts "Origen"
puts "Usuario #{bd_usuarios[0].nombre} - Cuenta #{bd_usuarios[0].cuentas[0].banco} => Monto a Transferir #{bd_usuarios[0].cuentas[0].saldo}"
puts "Destino"
puts "Usuario #{bd_usuarios[1].nombre} - Cuenta #{bd_usuarios[1].cuentas[1].banco}"

bd_usuarios[0].cuentas[0].transferir(bd_usuarios[0].saldo_total, bd_usuarios[1].cuentas[1])

puts "\nResultado Transferencia - Saldos Totales"
bd_usuarios.count.times do |i|
    puts "#{bd_usuarios[i].nombre} => #{bd_usuarios[i].saldo_total}"
end

puts "\nDetalles de cuentas"
bd_usuarios.count.times do |i|
    puts "Usuario #{i+1}: #{bd_usuarios[i].nombre} \nCuentas:"
    bd_usuarios[i].cuentas.each do |cuenta_test|
        puts "#{cuenta_test.banco} - Nº #{cuenta_test.numero_de_cuenta} - Saldo Actual #{cuenta_test.saldo}"
    end
    puts "\n"
end