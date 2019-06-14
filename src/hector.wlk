import wollok.game.*
import verduras.*
import mercado.*

object hector {
	
	var property position =  game.at(1,1)
	
	const property imagen = "player.png"
	
	const property cosecha  = #{}
	
	var property oro = 0
	
	var property plantasParaVender = 0
	
	method cobrar(){
		
		oro += self.montoTotalDeLaCosecha()
	}
	method reiniciarCosecha(){
		
		plantasParaVender = 0
	}
	method tengoPlantasParaVender(){
		
		return plantasParaVender > 0
	}
	
	method venderAMercado(){
		
		if (self.noEstaSobreAlgo()){
			
			errores.noEstoyEnMercado()
		}
		
		else {
			
			self.estaSobreAlgo().queSoy()
			
			/*self.estaSobreAlgo().mercaderia().addAll(cosecha)
			
			self.estaSobreAlgo().pagar()
			
			cosecha.clear()
			
			plantasParaVender = 0*/
			
		}
		
		
	}
		
	method vender(){
	
		if (self.tengoPlantasParaVender()){
			
			self.venderAMercado()
			
		}
		else {	
			
			game.say(self,errores.nadaParaVender())
	
			
		}
		
		
	}
	
	method montoTotalDeLaCosecha(){
		
		return cosecha.asList().sum {planta => planta.vender() }
	}
	
	method image(){
		
		return "player.png"
	}
	
	method move(nuevaPosicion){
		
		self.position(nuevaPosicion)	
	}
	
	method oroYCantidad(){
		
		game.say(self,"Tengo " + self.oro() + " de oro y " + self.plantasParaVender() +" plantas para vender." )
	}
	
	method plantar(verdura){
		
		if(self.noEstaSobreAlgo()){
			
			verdura.position(self.position())
			
			game.addVisual(verdura)
			
			}
		else {
			game.say(self,errores.yaHayCultivo())
		}
	}
	
	method cantidadDePlantas(){
		
		return cosecha.size()
	}
	
	method regar(){
		
		if (not self.noEstaSobreAlgo()){
			
			self.estaSobreAlgo().regarse()
	}
		else {
			
			game.say(self,errores.noHayQueRegar())
		}
	}
	
	method noEstaSobreAlgo(){
		
		return game.colliders(self).isEmpty()

	}
	
	method estaSobreAlgo(){
		
		return game.colliders(self).first()
		
	}
	
	method sePuedeCosechar(){
	
		return self.estaSobreAlgo().listaParaCosechar()
	}

	method cosechar(){
		
		if (self.noEstaSobreAlgo()){
			
			game.say(self,errores.noHayQueCosechar())
			
		
	}
		else if (not self.noEstaSobreAlgo() and self.sePuedeCosechar() ){
			
			cosecha.add(self.estaSobreAlgo())
			
			self.estaSobreAlgo().cosechar()
			
			plantasParaVender++
			}
		else {
			
			game.say(self,errores.faltaCosecha())
		}
	
	}
	


}

object errores{
	
	method faltaCosecha(){
		return "Le falta para cosechar."
	}
	
	method noHayQueCosechar(){
		return "No hay nada que cosechar."
	}
	
	method noHayQueRegar(){
		return "No hay nada que regar."
	}
	method yaHayCultivo(){
		return "Ya hay un cultivo aca."
	}
	method nadaParaVender(){
		return "No tengo nada para vender."
	}
	method noEstoyEnMercado(){
		return "No estoy en un mercado."
	}
	method noTengoDinero(){
		return "No tengo dinero para comprar la cosecha."
	}
}
