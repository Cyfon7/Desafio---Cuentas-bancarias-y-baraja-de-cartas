#Ejercicio Baraja de Cartas
require_relative 'carta'

class Baraja
    attr_accessor :cartas

    def initialize(cartas = [])
        @cartas = cartas
        ['C','D','E','T'].each do |pinta|
            13.times do |i|
                @cartas.push( Carta.new(i+1, pinta) )
            end
        end
        @cartas
    end

    def barajar
        @cartas.shuffle!
    end

    #Tecnicamente la primera carta vienen siendo la ultima
    #porque las cartas estan boca abajo ;)
    def sacar   
        @cartas.pop
    end

    def repartir_mano
        mano = []
        5.times do
            mano.push( self.sacar )
        end
        mano
    end

end

#Funcion para mostrar el estado de la baraja
def print_baraja(baraja)
    baraja.cartas.each do |carta|
        print "#{carta.numero}-#{carta.pinta} \t"
        if ( ( baraja.cartas.index(carta) + 1 ) % 8 == 0 )
            print "\n"
        end
    end
    puts "\nCartas Restantes = #{baraja.cartas.count}"
end


#Lineas para probar el codigo
#Creacion de Baraja
puts "Valores de Prueba"
baraja = Baraja.new
print_baraja(baraja)

#Probando el metodo de instancia "barajar"
puts "\nBarajar"
baraja.barajar
print_baraja(baraja)

#Probando el metodo de instancia "sacar"
puts "\nSacar una carta"
carta1 = baraja.sacar
puts "Carta = #{carta1.numero}-#{carta1.pinta}"
puts "Cartas Restantes = #{baraja.cartas.count}"

#Probando el metodo de instancia "repartir_manos"
puts "\nRepartir Mano (5 cartas)"
manomanito = baraja.repartir_mano
puts "Mano "
manomanito.each {|carta| puts "#{carta.numero}-#{carta.pinta}"}

#Estado final de la baraja
puts "\nBaraja final"
print_baraja(baraja)