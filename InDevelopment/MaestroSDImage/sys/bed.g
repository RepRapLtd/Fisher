; Auto calibration routine for delta printers
; Before running this, you should have set up your zprobe X, Y and Z offsets to suit your build.
; This does a single iteration of auto calibration. Run this file multiple times until the values converge.
; Then transfer the values to your config.g file.

M561 ; clear any bed transform, otherwise homing may be at the wrong height
G29  ; Probe the mesh and make the map

;******** Below commented out *************************************************
;G31 X0 Y0					; don't want any probe offset for this
;G28							; home the printer

;*** Remove the following line if your Z probe does not need to be deployed
;M98 Pdeployprobe.g			; deploy the mechanical Z probe

;M201 X1500 Y1500 Z1500
; The first time the probe is used after deployment, it gives slightly different results.
; So do an extra dummy probe here. The value stored gets overwritten later.
;G30 P0 X0 Y0 Z-99999

; Probe the bed and do auto calibration
;G1 X-64.95 Y-37.5 F12000
;G4 P300
;G30 P0 X-64.95 Y-37.5 Z-99999	    ; X tower
;G4 P300
;G30 P1 X64.95 Y-37.5 Z-99999	    	; Y tower
;G4 P300
;G30 P2 X0 Y75 Z-99999			; Z tower
;G4 P300
;G30 P3 X0 Y0 Z-99999 S0		; centre, and auto-calibrate

;*** Remove the following line if your Z probe does not need to be retracted
;M98 Pretractprobe.g			; deploy the mechanical Z probe

;M201 X8000 Y8000 Z8000

;G91
;G1 S1 X170 Y170 Z170 F15000	; go part way up to speed up homing, endstops activated just in case
;G90
;G28							; Home the printer again so as to activate the new endstop adjustments
