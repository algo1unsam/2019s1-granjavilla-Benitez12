import wollok.game.*
import hector.*


class Maiz  {
	
	var property position
	
	var property image = "corn_baby.png"
	
	
	method regarse(){
		image = "corn_adult.png"
	}
	
	method adulto(){
		return self.image() == "corn_adult.png"
	}
	
	method cosechar(){
		if (self.adulto()){
			game.removeVisual(self)
		}
		else{
			game.say(hector,"Le falta para cosechar")
		}
	}
	
}


class Trigo {
	
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
	
	method cosechar(){
		if (etapa >=2){
			game.removeVisual(self)
		}
		else{
			game.say(hector,"Le falta para cosechar")
		}
	}
}


class Tomaco  {
	
	var property position
	
	var property image = "tomaco.png"
	
	method regarse(){
		
		position = position.up(1)
		
		if (self.seFueDelTablero()){
			self.volverAbajo()
		}	
	}
	
	method seFueDelTablero(){
		return position.y() == 10
	}
	
	method volverAbajo() = (position = game.at(position.x(),0))
	
	method cosechar(){
			game.removeVisual(self)
	
		}
	}
	
	
	

