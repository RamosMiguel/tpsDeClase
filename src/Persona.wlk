import Parasito.*

class Persona { 
	var cordura
	var infectado=false
	var parasitos=[]
	
	
	method infectarse(nuevoParasito){
		parasitos.add(nuevoParasito)
		infectado=true
	}
	
	method cordura(valor){
		cordura=valor
	}
	
	method infectar(persona){
		
		var infecciosos=parasitos.filter({parasito=>parasito.lastima()<persona.cordura()})
		infecciosos.forEach({parasito=>  
										var nuevoParasito=new Parasito()
										nuevoParasito.poder((parasito.poder()/2).max(1))
										nuevoParasito.lastima((parasito.lastima()/4).max(10))
										persona.infectarse(nuevoParasito)
										
		})
		 
		
	}
	
	method accionDeLosParasitos(){
		cordura-=parasitos.sum({parasito=>parasito.poder()})
	}
	 
	
	method cordura(){
		return cordura 
	}
	
	method cantidadParasitos(){
		return parasitos.size()
	}
}

