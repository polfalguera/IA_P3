(define (problem Mart-Problem1)
   (:domain Mart)
   (:objects 
        AL1 AL2 AL3 AL4 AL5 AL6 - almacen
        AS1 AS2 AS3 AS4 - asentamiento
        Marc Alex Pol Jin Wiki Lluc Maseo LianYu Socio - persona
        Manzanas Peras Naranjas Melones Leche Mejillones - suministro
        R1 R2 R3 - rover
    )

  (:init
    (= (personaCargada R1) 0)
    (= (personaCargada R2) 0)
    (= (personaCargada R3) 0)
    (= (suministroCargado R1) 0)
    (= (suministroCargado R2) 0)
    (= (suministroCargado R3) 0)
    (= (combustible R1) 10)
    (= (combustible R2) 10)
    (= (combustible R3) 10)
    
    (= (totalCost) 0)

    (accesible AL1 AL2) (accesible AL2 AL1)
    (accesible AL1 AL3) (accesible AL3 AL1)
    (accesible AL1 AL4) (accesible AL4 AL1)
    (accesible AL1 AL5) (accesible AL5 AL1)
    (accesible AL1 AL6) (accesible AL6 AL1)
    (accesible AS1 AS2) (accesible AS2 AS1)
    (accesible AS1 AS3) (accesible AS3 AS1)
    (accesible AS1 AS4) (accesible AS4 AS1)
    (accesible AS1 AL1) (accesible AL1 AS1)
    (accesible AS3 AL4) (accesible AS2 AS3)
    (accesible AS4 AL1) (accesible AL6 AS4)
    (accesible AS2 AL2) (accesible AL2 AS2)
    
    (estacionado R1 AL3) (estacionado R2 AS1) (estacionado R3 AL2)

    (destino Marc AS1)(destino Alex AS2)(destino Pol AS3)(destino Jin AS4)
    (destino Wiki AS1)(destino Lluc AS2)(destino Maseo AS3)(destino LianYu AS4)
    (destino Socio AS1)(destino Manzanas AL1) (destino Peras AL2)(destino Naranjas AL3)
    (destino Melones AL4) (destino Leche AL5)(destino Mejillones AL6)

    (en Pol AS4)(en Jin AS1)(en Wiki AS2)(en Lluc AS3)(en Maseo AS4)
    (en LianYu AS1)(en Socio AS2)(en Marc AS2)(en Alex AS3)(en Manzanas AL2)
    (en Peras AL3)(en Naranjas AL4)(en Melones AL5)(en Leche AL6)
    (en Mejillones AL1)
    

    (pendiente Marc)(pendiente Alex)(pendiente Pol)(pendiente Jin)
    (pendiente Wiki)(pendiente Lluc)(pendiente Maseo)(pendiente LianYu)
    (pendiente Socio)(pendiente Manzanas)(pendiente Peras)(pendiente Naranjas)
    (pendiente Melones)(pendiente Leche)(pendiente Mejillones)

    (isPersona Pol)(isPersona Jin)(isPersona Wiki)(isPersona Lluc)(isPersona Maseo)
    (isPersona LianYu)(isPersona Socio)(isPersona Marc)(isPersona Alex)

    (isSuministro Manzanas)(isSuministro Peras )(isSuministro Naranjas )
    (isSuministro Melones )(isSuministro Leche )(isSuministro Mejillones)

    (isAlmacen AL1)(isAlmacen AL2)(isAlmacen AL3)(isAlmacen AL4)
    (isAlmacen AL5)(isAlmacen AL6)

    (isAsentamiento AS1)(isAsentamiento AS2)(isAsentamiento AS3)
    (isAsentamiento AS4)
  )

  (:goal (forall (?t - transportable) (servido ?t)))
  (:metric minimize (totalCost))
)
