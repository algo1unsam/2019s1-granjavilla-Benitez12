import wollok.game.*
import verduras.*
object hector {
	
	var property position =  game.at(1,1)
	var property imagen = "player.png"
	
	method image(){
		
		return "player.png"
	}
	
	method move(nuevaPosicion){
		
		self.position(nuevaPosicion)
		
	}
	
	method plantar(verdura){
		verdura.position(self.position())
		game.addVisual(verdura)
		
	}
	
	method regar(verdura){
		verdura.regarse()
	}
	
	method estaSobre(){
		
	}
	
	
	
}
