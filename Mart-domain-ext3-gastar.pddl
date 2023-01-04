(define (domain Mart3Gastar)
  (:requirements :adl :typing :fluents)

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
   (isPersona ?p - transportable)
   (isSuministro ?s - transportable)
   (isAsentamiento ?s - lugar)

   (prioridad1 ?t - transportable)
   (prioridad2 ?t - transportable)
   (prioridad3 ?t - transportable)
  )

  (:functions
    (personaCargada ?r - rover)
    (suministroCargado ?r - rover)
    (combustible ?r - rover)
    (servidos)
    (prio1)
    (prio2)
    (prio3)
  )

  (:action montar_en_Rover
    :parameters (?t - transportable ?r - rover ?l - lugar)
    :precondition (and (pendiente ?t) (en ?t ?l) 
                       (estacionado ?r ?l)
                       (not (montado ?t ?r))
                       (or 
                        (and (isPersona ?t) (= (suministroCargado ?r) 0) (< (personaCargada ?r) 2))
                        (and (isSuministro ?t) (= (suministroCargado ?r) 0) (= (personaCargada ?r) 0))
                       )    
                       (or 
                        (and (prioridad2 ?t) (= (prio3) 0))
                        (and (prioridad1 ?t) (= (prio3) 0) (= (prio2) 0))
                        (prioridad3 ?t)
                       )
                  )
    :effect (and (montado ?t ?r) 
                 (not (en ?t ?l)) (not (pendiente ?t))
                 (when (isPersona ?t) (increase (personaCargada ?r) 1))
                 (when (isSuministro ?t) (increase (suministroCargado ?r) 1))
            )
  )

	(:action bajar_de_Rover
    :parameters (?t - transportable ?r - rover ?l - lugar)
    :precondition (and (montado ?t ?r)
                       (estacionado ?r ?l)
                       (destino ?t ?l)
                       (or (and (isPersona ?t) (isAsentamiento ?l))
                           (isSuministro ?t)
                       )
                  ) 
                  
    :effect (and (en ?t ?l) 
                 (not (montado ?t ?r)) 
                 (servido ?t) 
                 (when (isPersona ?t) (decrease (personaCargada ?r) 1))
                 (when (isSuministro ?t) (decrease (suministroCargado ?r) 1))
                 (increase (servidos) 1)
                 (when (prioridad1 ?t) (decrease (prio1) 1))
                 (when (prioridad2 ?t) (decrease (prio2) 1))
                 (when (prioridad3 ?t) (decrease (prio3) 1))
            )
  )

  (:action mover_Rover
    :parameters (?r - rover ?o - lugar ?d - lugar)
    :precondition (and (estacionado ?r ?o) (accesible ?o ?d) (> (combustible ?r) 0))
    :effect (and (estacionado ?r ?d) (not (estacionado ?r ?o)) (decrease (combustible ?r) 1))
  )
)