import wollok.game.*
import verduras.*


object hector {
	
	var property position =  game.at(1,9)
	var property imagen = "player.png"
	var property cosecha  = []
	
	method image(){
		
		return "player.png"
	}
	
	method move(nuevaPosicion){
		
		self.position(nuevaPosicion)	
	}
	
	method plantar(verdura){
		
		if(self.noEstaSobreAlgo()){
			verdura.position(self.position())
			game.addVisual(verdura)
			
			}
		else {
			game.say(self,"Ya hay un cultivo aca")
		}
	}
	
	method regar(){
		
		if (not self.noEstaSobreAlgo()){
			
			self.estaSobreAlgo().regarse()
	}
		else {
			
			game.say(self,"No hay nada que regar")
		}
	}
	
	method noEstaSobreAlgo(){
		
		return game.colliders(self).isEmpty()

	}
	
	method estaSobreAlgo(){
		
		return game.colliders(self).first()
		
	}
	

	method cosechar(){
		
		if (not self.noEstaSobreAlgo()){
			
			cosecha.add(self.estaSobreAlgo())
			
			self.estaSobreAlgo().cosechar()
			
			
	}
		else {
			
			game.say(self,"No hay nada que cosechar")
		}
	}
	
}
