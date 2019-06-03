import hector.*
import wollok.game.*

class Mercado{
	
	var property cantidadDeMonedas 
	
	var property position
	
	var property mercaderia = #{}
	
	method image() = "market.png"
	
	method queSoy(){
		
		if (self.puedoComprar()){
			
			self.mercaderia().addAll(hector.cosecha())
			
			self.pagar()
			
			hector.cosecha().clear()
			
			hector.reiniciarCosecha()
		}
		else{
			
			game.say(self,errores.noTengoDinero())
		}
		
	}
	method puedoComprar(){
		
		return not game.colliders(self).isEmpty() and self.tengoOroParaComprar()
			
	}
	
	method tengoOroParaComprar(){
		
		return self.cantidadDeMonedas() >= hector.montoTotalDeLaCosecha()
	}
	
	method pagar() {
		
		hector.cobrar()
		
		cantidadDeMonedas -= hector.montoTotalDeLaCosecha()
	} 	
	

	
}
