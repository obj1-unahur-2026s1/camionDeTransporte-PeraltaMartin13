object knigthRider {
    method peso() = 500
    method peligrosidad() = 10
    method cantBulto() = 1
    method consecuenciaCarga() {}
    
}

object bumblebee {
    var formaActual = "Auto"

    method transformarseEnRobot() {
    formaActual = "Robot"
    }

    method transformarseEnAuto() {
    formaActual = "Auto"
    }
    
    method peso() = 800

    method cantBulto() = 2

    method consecuenciaCarga() {
      self.transformarseEnRobot()
    }


    method peligrosidad() {
      if (formaActual == "Auto"){
        return 15
      } else {
        return 30
      }
    }
  
}

object paqueteDeLadrillos {
    var cantidad = 100

    method setCantidad(unaCantidad) {
      cantidad = unaCantidad
    }

    method peso() = cantidad * 2

    method peligrosidad() = 2

    method cantBulto() {
        if(cantidad <= 100){
            return 1
        } else if(cantidad.between(101, 300)) {
            return 2
        } else{
            return 3
        }  
    }

    method getCantidad() = cantidad

    method consecuenciaCarga() {
      cantidad += 12
    }
    
}

object arenaAGranel {
    var peso = 100

    method setPeso(unaCantidad){
        peso = unaCantidad
    }

    method peso() = peso

    method peligrosidad() = 1

    method cantBulto() = 1

    method consecuenciaCarga() {
      peso = (peso -10).max(0)
    }
}

object bateriaAntiAerea{
    var tieneMisiles = true

    method sacarMisiles() {
      tieneMisiles = false
    }

    method ponerMisiles() {
      tieneMisiles = true
    }

    method cantBulto() = if(tieneMisiles) 2 else 1

    method peso() {
      if(tieneMisiles){
        return 300
      } else {
        return 200
      }
    }

    method peligrosidad() {
      if(tieneMisiles){
        return 100
      } else {
        return 0
      }
    }

    method consecuenciaCarga() {
      tieneMisiles = true
    }
}

object contenedorPortuario {
  const contiene = #{}

  method agregarAContiene(unaCosa) {
        contiene.add(unaCosa)
  }

  method quitarAContiene(unaCosa) {
        contiene.remove(unaCosa)
  }

  method cantBulto() {
      return 1 + contiene.sum({e => e.cantBulto()})
    }


  method pesoContiene() {
    return contiene.sum{e => e.peso()}
  }

  method mayorPeligroEnContiene() {
    if(contiene.isEmpty()){
        return 0
    } else {
        return contiene.max{e => e.peligrosidad()}.peligrosidad()
    }
  }

  method peso() = 100 + self.pesoContiene()

  method peligrosidad() = self.mayorPeligroEnContiene()

  method consecuenciaCarga() {
      contiene.forEach({e => e.consecuenciaCarga()})
    }
}

object residuosRadioactivos {
  var peso = 100

  method setPeso(unValor) {
    peso = unValor
  }

  method peso() = peso

  method peligrosidad() = 200

  method cantBulto() = 1

  method consecuenciaCarga() {
      peso += 15
    }

}

object embalajeSeguridad {
  var contiene = residuosRadioactivos

  method setContenido(unaCosa) {
   contiene = unaCosa
  }

  method peso() = contiene.peso()

  method peligrosidad() = contiene.peligrosidad() / 2

  method cantBulto() = 2

  method consecuenciaCarga() {}

}