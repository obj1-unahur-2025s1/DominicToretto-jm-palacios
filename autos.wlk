object dominic {
  const autos = []

  method conseguir(unAuto) {autos.add(unAuto)}
  method autosNoEnCondiciones() = autos.filter({a => not a.enCondiciones()}) 
  method autosEnCondiciones() = autos.filter({a =>a.enCondiciones()})
  method mandarAutosAlTaller() {
    taller.recibirAutos(self.autosNoEnCondiciones())
  }
  method testVelocidad() {
    autos.forEach({a => a.hacerPrueba()})
  }
  method venderAutos() {
    autos.clear()
  }
  method promedioVelocidades() = autos.sum({a => a.velocidadMaxima()}) / autos.size()
  method masRapido() = self.autosEnCondiciones().max({a =>a.velocidadMaxima()}) 
  method hayUnAutoMuyRapido() = self.masRapido().velocidadMaxima() > 2*self.promedioVelocidades() 
}

object taller {
  const autosAReparar = []

  method recibirAutos(listaDeAutos) {
    autosAReparar.addAll(listaDeAutos)
  }
  method repararAutos() {
    autosAReparar.forEach({a => a.reparar()})
    autosAReparar.clear()
  }   
}

object ferrari {
  var motor = 87
  method enCondiciones() = motor >= 65
  method reparar() {motor = 100}
  method velocidadMaxima() = 110 + if(motor>75) 15 else 0
  method hacerPrueba() {motor = (motor - 30).max(0)}
  
}
object flecha {
  var cantidadLitrosCombustible = 100
  var property tipoCombustible = gasolina
  var color = azul
   
  method enCondiciones() = 
      cantidadLitrosCombustible > tipoCombustible.nivelMinimo() and
      color.esAptoParaCorrer()
  method hacerPrueba() {
    cantidadLitrosCombustible = (cantidadLitrosCombustible - 5).max(0)
  }    
  method reparar() {
    cantidadLitrosCombustible = cantidadLitrosCombustible * 2
    color = color.cambiarDeColor()    
  }
  method velocidadMaxima() {
    return cantidadLitrosCombustible * 2 + tipoCombustible.calculoAdicional(cantidadLitrosCombustible)
  } 
}
object gasolina {
  method nivelMinimo() = 85
  method calculoAdicional(litros) = 10 
  
}
object nafta {
  method nivelMinimo() = 50
  method calculoAdicional(litros) = -1 * (litros * 2) * 0.10
  
}
object nitrogeno {
  method nivelMinimo() = 0
  method calculoAdicional(litros) = (litros*2) * 10 
  
}
object azul {
  method cambiardeColor() = verde
  method esAptoParaCorrer() = false
}
object rojo {
  method cambiarDeColor() = azul  
  method esAptoParaCorrer() = true
}
object verde {
  method cambiarDeColor() = rojo 
  method esAptoParaCorrer() = false  
}

object intocable {
  var property enCondiciones = true

  method hacerPrueba() {enCondiciones = false}
  method reparar() {enCondiciones = true}
  method velocidadMaxima() = 45  
}
object inventado {
  var combustible = 100
  var motor = 75
  
  method enCondiciones() = motor > 70
  method reparar() { 
    combustible = 100
    motor = 100} 
  method hacerPrueba() {
    combustible = (combustible * 0.9).max(0)
    motor = (motor -10).max(0)    
  } 
  method velocidadMaxima() = combustible * 1.5 
}