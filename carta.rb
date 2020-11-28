class Carta
    attr_accessor :numero, :pinta, :mano
    def initialize(numero, pinta)
        #Excepcion para numero
        raise ArgumentError, "\nArgumento numero debe estar entre 1 - 13" if (numero<1 || numero>13)
        
        #Excepcion para pinta
        raise ArgumentError, "\nArgumento pinta debe ser un String: \n* 'C' -> Corazon \n* 'D' -> Diamante \n* 'E' - Espada \n* 'T' - Trebol" if (pinta.class != String ||  !['C','D','E','T'].include?(pinta))
        @numero = numero
        @pinta = pinta
    end
end