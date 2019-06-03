import wollok.game.*
import hector.*
import mercado.*

class Verdura{
	
	method cosechar(){
		
		game.removeVisual(self)
	}

	method queSoy(){
		
		game.say(self,"NO SOY UN MERCADO!")
	}
}
class Maiz inherits Verdura {
	
	var property position
	
	var property image = "corn_baby.png"
	
	
	method regarse(){
		image = "corn_adult.png"
	}
	
	method listaParaCosechar(){
		return self.image() == "corn_adult.png"
	}
	
	method vender(){
		return 150
	}

	
}


class Trigo inherits Verdura{
	
	var property position
	
	var property etapa = 0
	
	method regarse(){
		
		etapa++
		
	if (etapa > 3){
		
		self.reiniciarEtapa()
	}
	}
	
	method image(){
		return  "wheat_" + etapa + ".png"
	}
	
	method listaParaCosechar(){
		return etapa >= 2
	}
	
	method reiniciarEtapa(){
		etapa = 0
	}
	
	method vender(){
		if (etapa == 2){
			return 100
		}
		else {
			return 200
		}
	}
	
	
}


class Tomaco inherits Verdura {
	
	var property position
	
	const property image = "tomaco.png"
	
	method regarse(){
		
		position = position.up(1)
		
		if (self.seFueDelTablero()){
			
			self.volverAbajo()
		}	
	}
	
	method seFueDelTablero(){
		return position.y() == 10
	}
	
	method volverAbajo() { position = game.at(position.x(),0)}
	
		
	method listaParaCosechar(){
		return true 
	}

	method vender(){
		
		return 800
	}	
	
}
	
	
	

