(define (domain Mart)
  (:requirements :adl :typing)

  (:types transportable rover lugar - object
          almacen asentamiento - lugar
          persona suministro - transportable
	)           

  (:predicates
   (estacionado ?r - rover ?l - lugar)
   (destino ?t - transportable ?l - lugar)
   (en ?t - transportable ?l - lugar)
   (pendiente ?t - transportable)
   (servido ?t - transportable)
   (montado ?t - transportable ?r - rover)
   (accesible ?o - lugar ?d - lugar)
   (isPersona ?p transportable)
   (isSuministro ?s transportable)
   (isAlmacen ?p lugar)
   (isAsentamiento ?s lugar)
  )

  (:action montar_en_Rover
    :parameters (?t - transportable ?r - rover ?l - lugar)
    :precondition (and (pendiente ?t) (en ?t ?l) 
                       (estacionado ?r ?l)
                       (not (montado ?t ?r))
                   )    
    :effect (and (montado ?t ?r) 
                 (not (en ?t ?l)) (not (pendiente ?t))
            )
  )

	(:action bajar_de_Rover
    :parameters (?t - transportable ?r - rover ?l - lugar)
    :precondition (and (dentro ?t ?r)
                       (estacionado ?r ?l)
                       (destino ?t ?l)
                       (or (and (isPersona ?t) (isAsentamiento ?l))
                           (and (isSuministro ?t) (isAlmacen ?l))
                           )
                       ) 
                  
    :effect (and (en ?t ?l) 
                 (not (montado ?t ?r)) 
                 (servido ?t) 
            )
  )

  (:action mover_Rover
    :parameters (?r - rover ?o - lugar ?d - lugar)
    :precondition (and (estacionado ?r ?o) (accesible ?o ?d))
    :effect (and (estacionado ?r ?d) (not (estacionado ?r ?o)))
  )
)