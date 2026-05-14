import cosas2.*


object camion {
    const almacen = []
    
    method cantidadTotalDeBultos() {
      return almacen.sum({e => e.cantBulto()})
    }

    method retirarDeAlmacen(cosa) { 
        almacen.remove(cosa)
    }

    method agregarAAlmacen(cosa) { 
        almacen.add(cosa)
        cosa.consecuenciaCarga()
    }
    
    method pesoTotal() {
        return 1000 + almacen.sum{e => e.peso()}
    }

    method esParPesosDeAlmacen() {
      return almacen.all{e => e.peso().even()}
    }

    method hayCosaConPeso(unPeso) {
      return almacen.any{e => e.peso() == unPeso}
    }

    method hayCosaConPeligro(unPeligro) {
      return almacen.any{e => e.peligrosidad() == unPeligro}
    }

    method hayCosaConMasPeligroQue(unPeligro) {
      return almacen.any{e => e.peligrosidad() > unPeligro}
    }

    method getCosaConPeligro(unPeligro) {
      return almacen.find{e => e.peligrosidad() == unPeligro}
    }

    method getCosasConPeligrosidadMayor(unPeligro) {
      return almacen.filter{e => e.peligrosidad() > unPeligro}
    }

    method getCosasMasPeligrosasQue(unaCosa) {
      return almacen.filter{e => e.peligrosidad() > unaCosa.peligrosidad()}
    }

    method excedePesoMaximo() {
      return self.pesoTotal() > 2500
    }

    method puedeCircular(nivelDePeligrosidad) = not self.excedePesoMaximo() and not self.hayCosaConMasPeligroQue(nivelDePeligrosidad)
    
    method hayCosaEntrePesos(unPesoMin, unPesoMax){
        return almacen.any{e => e.peso() >= unPesoMin and e.peso()<= unPesoMax}
    } 

    method getCosaMasPesada() = almacen.max{e => e.peso()}


}