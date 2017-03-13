//: velocimetroAutomovilDigital
/*
 
 Instructionsmenos
Crea un playground que contenga los elementos para representar un velocímetro de un automóvil.
Recuerda que estamos practicando la programación orientada a objetos y primero debes diseñar la clase, enumeraciones o estructuras para llevarlas a un aplicación móvil. ¿Qué debes de realizar?
 
 Declara la enumeración: Velocidades, sus valores serán de tipo Int.
 
 La enumeración Velocidades cuenta con los siguientes elementos y sus respectivos valores:
 
 - Apagado = 0, representa la velocidad 0.
 
 - VelocidadBaja = 20, representa una velocidad de 20km por hora.
 
 - VelocidadMedia = 50, representa una velocidad de 50km por hora
 
 - VelocidadAlta = 120, representa una velocidad de 50km por hora.
 
 - Además, debes de declarar un inicializador que recibe un velocidad:
 
 - init( velocidadInicial : Velocidades )
 
 - El inicializador se debe asignar a self el valor de velocidadInicial
 
 Declara la clase: Auto
 
 La clase Auto tiene los siguientes atributos:
 
 - Una variable que sea una instancia de la enumeración Velocidades, llamada: velocidad.
 
 Las funciones o métodos que define la clase Auto son las siguientes:
 
 - init( ), agrega la función inicializadora que crea una instancia de Velocidades: velocidad, debe iniciar en Apagado. Recuerda que la enumeración tiene su función inicializadora.
 
 - func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String), la función cambioDeVelocidad, cambia el valor de velocidad a la siguiente velocidad gradual, por ejemplo: Apagado cambia a VelocidadBaja, de VelocidadBaja cambia a VelocidadMedia, es decir cada ejecución cambia a la siguiente velocidad.. si llega a VelocidadAlta cambia a VelocidadMedia. Finalmente, la función debe regresar una tupla con la velocidad actual y una cadena con la leyenda de la velocidad correspondiente.
*/

import UIKit

enum Velocidades : Int {
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init(velocidadInicial : Velocidades) {
        self = velocidadInicial
    }
}


class Auto {
    var velocidad = Velocidades(velocidadInicial: Velocidades.VelocidadBaja)
    
    init() {
        self.velocidad = Velocidades.Apagado
    }

    func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String) {
        
        switch velocidad {
        case .Apagado:
            velocidad = Velocidades.VelocidadBaja
            return (velocidad.rawValue,  "Velocidad Baja")
        case .VelocidadBaja:
            velocidad = Velocidades.VelocidadMedia
            return (velocidad.rawValue, "Velocidad Media")
        case .VelocidadMedia:
            velocidad = Velocidades.VelocidadAlta
            return (velocidad.rawValue, "Velocidad Alta")
        case .VelocidadAlta:
            velocidad = Velocidades.VelocidadMedia
            return (velocidad.rawValue, "Velocidad Media")
        }
        
    }
}

var auto = Auto()
var valorVelocidad = (actual : 0, velocidadEnCadena : "Apagado")
for i in 0...19 {
    
    print("\(valorVelocidad.actual), \(valorVelocidad.velocidadEnCadena)")
    valorVelocidad = auto.cambioDeVelocidad()
}
