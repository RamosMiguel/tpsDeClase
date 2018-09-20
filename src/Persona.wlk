import Parasito.*

class Persona { 
	var cordura
	var infectado=false
	var parasitos=[]
	
	method nombre(nuevoNombre){
		nombre=nuevoNombre
	}
	method infectarse(nuevoParasito){
		parasitos.add(nuevoParasito)
		infectado=true
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
	
	method corduraInicial(valor){
		cordura=valor
	}
	
	method cordura(){
		return cordura 
	}
}

