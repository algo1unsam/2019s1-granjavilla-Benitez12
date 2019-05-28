import wollok.game.*
import verduras.*

object hector {
	
	var property position =  game.at(1,1)
	var property imagen = "player.png"
	
	method image() = "player.png"

	method move(nuevaPosicion){
		
		self.position(nuevaPosicion)
		
	}
	
	method plantar(verdura){
		if (self.estaSobreVerdura(verdura)){
			game.say(self,"Hay algo aca")
		}
		else
		{
		verdura.position(self.position())
		game.addVisual(verdura)
		}
		
	}
	
	method regar(verdura){
		verdura.regarse()
	}
	
	method estaSobreVerdura(verdura){
		return verdura.position() == self.position()
	}
	
	
}
