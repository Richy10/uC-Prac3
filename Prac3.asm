;**************** Definiciones e Includes ********************************
.INCLUDE "m2560def.inc" ; Include Register/Bit Definitions for the 1280
;********************** M A C R O S **************************************
;*************************************************************************
; miRetardo
; Descripción: Retardo de X mS basado en ciclos anidados
; Registros usados: R24, R25 y R26
; Valores de Retorno: N/A
; Nota: Esto registros son modificados y se pierde el valor original
;*************************************************************************
.MACRO 		miRetardo
			clr r24
nxt0: 		clr r25
nxt1: 		clr r26
nxt2: 		dec r26
			brne nxt2
			dec r25
			brne nxt1
			dec r24
			brne nxt0

.ENDMACRO
;********************** Inicialización *********************************
			sbi DDRB,PB7 ; configurar PB7 como salida
;********************** Ciclo Principal *********************************
next: 		sbi PORTB,7 ; Escribir 1 en PB7
			miRetardo ; Esperar X mS
			cbi PORTB,7 ; Escribir 0 en PB7
			miRetardo ; Esperar X mS
			rjmp next

;********************** FIN archivo **********************************

