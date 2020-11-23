
;;; source file for CC65 "remake" compiler
	.include "soundbs.mac"
	.global musicptr
	.rodata
musicptr:
	.word CHANNEL_0, CHANNEL_1, CHANNEL_2, CHANNEL_3

PATTERN_LENGTH   .set  2880

CHANNEL_0:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_00
  LOOP
CHAN_STOP

CHANNEL_1:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_01
  LOOP
CHAN_STOP

CHANNEL_2:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_02
  LOOP
CHAN_STOP

CHANNEL_3:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_03
  LOOP
CHAN_STOP

ENVIROS:
	SETPLAYERFREQ $9D,129
	DEF_VOLENV 1,TREMOLO_1
	DEF_VOLENV 2,TREMOLO_2
	DELAY 3
RETURN

TREMOLO_1:
.byte $02,$06,$15,$01,$06,$00,$02,$FC,$10,$00,$01,$FC,$02,$05
TREMOLO_2:
.byte $01,$05,$02,$04,$06,$00,$02,$FC,$10,$00,$01,$FC



PATTERN_00:
	INSTR2 $16,$00,$0d,24,127
	SET_VOLENV 1
	PLAY2 174,$7b,90
	PLAY2 146,$7b,90
	PLAY2 232,$7a,90
	PLAY2 174,$7a,90
	PLAY2 232,$7a,255
	DELAY 15
	PLAY2 174,$7a,45
	PLAY2 38,$7c,45
	PLAY2 146,$7a,90
	PLAY2 174,$7a,90
	PLAY2 232,$7a,90
	PLAY2 246,$7a,90
	PLAY2 130,$7b,255
	DELAY 15
	PLAY2 232,$7a,45
	PLAY2 130,$7b,45
	PLAY2 146,$7b,90
	PLAY2 38,$7d,90
	PLAY2 174,$7b,90
	PLAY2 146,$7b,90
	PLAY2 25,$7e,90
	PLAY2 232,$7a,255
	DELAY 735
RETURN


PATTERN_01:
	DELAY 360
	INSTR2 $16,$00,$0d,24,127
	SET_VOLENV 1
	PLAY2 184,$7a,255
	DELAY 1545
	INSTR2 $ea,$00,$80,24,127
	SET_VOLENV 2
	PLAY2 178,$7b,180
	PLAY2 168,$7b,180
	PLAY2 158,$7b,180
	PLAY2 168,$7b,180
RETURN


PATTERN_02:
	DELAY 2880
RETURN


PATTERN_03:
	DELAY 2880
RETURN