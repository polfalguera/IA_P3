(define (problem Mart-Problem2Gastar)
   (:domain Mart2Gastar)
   (:objects 
        AL1 AL2 AL3 AL4 AL5 AL6 - almacen
        AS1 AS2 AS3 AS4 - asentamiento
        Marc Alex Pol Jin Wiki Lluc Maseo LianYu Socio P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13 - persona
        Manzanas Peras Naranjas Melones Leche Mejillones S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 - suministro
        R1 R2 R3 - rover
    )

  (:init
    (= (personaCargada R1) 0)
    (= (personaCargada R2) 0)
    (= (personaCargada R3) 0)
    (= (suministroCargado R1) 0)
    (= (suministroCargado R2) 0)
    (= (suministroCargado R3) 0)
    (= (combustible R1) 100)
    (= (combustible R2) 100)
    (= (combustible R3) 100)
    
    (= (totalCost) 0)
    (= (servidos) 0)

    (accesible AL1 AL2) (accesible AL2 AL1)
    (accesible AL1 AS3) (accesible AS3 AL1)
    (accesible AS3 AS4) (accesible AS4 AS3)
    (accesible AL2 AL3) (accesible AL3 AL2)
    (accesible AL2 AL4) (accesible AL4 AL2)
    (accesible AL2 AS1) (accesible AS1 AL2)
    (accesible AL2 AS2) (accesible AS2 AL2)
    (accesible AL4 AL5) (accesible AL5 AL4)
    (accesible AL4 AL6) (accesible AL6 AL4)
    
    (estacionado R1 AL3) (estacionado R2 AS1) (estacionado R3 AL2)

    (destino Marc AS1)(destino Alex AS2)(destino Pol AS3)(destino Jin AS4)
    (destino Wiki AS1)(destino Lluc AS2)(destino Maseo AS3)(destino LianYu AS4)
    (destino Socio AS1)(destino Manzanas AL1)(destino Peras AL2)(destino Naranjas AL3)
    (destino Melones AL4)(destino Leche AL5)(destino Mejillones AL6)
    (destino P1 AS4)(destino P2 AS2)(destino P3 AS2)(destino P4 AS1)(destino P5 AS3)
    (destino P6 AS3)(destino P7 AS1)(destino P8 AS1)(destino P9 AS4)(destino P10 AS4)
    (destino P11 AS4)(destino P12 AS2)(destino P13 AS2)
    (destino S1 AL4)(destino S2 AL6)(destino S3 AL1)(destino S4 AL2)(destino S5 AL5)
    (destino S6 AL2)(destino S7 AL1)(destino S8 AL6)(destino S9 AL5)(destino S10 AL1)
    (destino S11 AL4)(destino S12 AL2)

    (en Pol AS4)(en Jin AS1)(en Wiki AS2)(en Lluc AS3)(en Maseo AS4)
    (en LianYu AS1)(en Socio AS2)(en Marc AS2)(en Alex AS3)(en Manzanas AL2)
    (en Peras AL3)(en Naranjas AL4)(en Melones AL5)(en Leche AL6)
    (en Mejillones AL1)
    (en P1 AS1)(en P2 AS3)(en P3 AS3)(en P4 AS2)(en P5 AS4)
    (en P6 AS4)(en P7 AS2)(en P8 AS2)(en P9 AS1)(en P10 AS1)
    (en P11 AS1)(en P12 AS3)(en P13 AS3)
    (en S1 AL5)(en S2 AL1)(en S3 AL2)(en S4 AL3)(en S5 AL6)
    (en S6 AL3)(en S7 AL2)(en S8 AL1)(en S9 AL6)(en S10 AL2)
    (en S11 AL5)(en S12 AL3)

    (pendiente Marc)(pendiente Alex)(pendiente Pol)(pendiente Jin)
    (pendiente Wiki)(pendiente Lluc)(pendiente Maseo)(pendiente LianYu)
    (pendiente Socio)(pendiente Manzanas)(pendiente Peras)(pendiente Naranjas)
    (pendiente Melones)(pendiente Leche)(pendiente Mejillones)
    (pendiente P1)(pendiente P2)(pendiente P3)(pendiente P4)(pendiente P5)(pendiente P6)
    (pendiente P7)(pendiente P8)(pendiente P9)(pendiente P10)(pendiente P11)(pendiente P12)
    (pendiente P13)(pendiente S1)(pendiente S2)(pendiente S3)(pendiente S4)(pendiente S5)
    (pendiente S6)(pendiente S7)(pendiente S8)(pendiente S9)(pendiente S10)(pendiente S11)
    (pendiente S12)

    (isPersona Pol)(isPersona Jin)(isPersona Wiki)(isPersona Lluc)(isPersona Maseo)
    (isPersona LianYu)(isPersona Socio)(isPersona Marc)(isPersona Alex)
    (isPersona P1)(isPersona P2)(isPersona P3)(isPersona P4)(isPersona P5)(isPersona P6)
    (isPersona P7)(isPersona P8)(isPersona P9)(isPersona P10)(isPersona P11)(isPersona P12)
    (isPersona P13)

    (isSuministro Manzanas)(isSuministro Peras )(isSuministro Naranjas )
    (isSuministro Melones )(isSuministro Leche )(isSuministro Mejillones)
    (isSuministro S1)(isSuministro S2)(isSuministro S3)(isSuministro S4)(isSuministro S5)
    (isSuministro S6)(isSuministro S7)(isSuministro S8)(isSuministro S9)(isSuministro S10)
    (isSuministro S11)(isSuministro S12)

    (isAsentamiento AS1)(isAsentamiento AS2)(isAsentamiento AS3)
    (isAsentamiento AS4)
  )

  (:goal (= (servidos) 5))
)
