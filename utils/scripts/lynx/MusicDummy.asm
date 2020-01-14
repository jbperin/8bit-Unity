
;;; source file for CC65 "remake" compiler
	.include "soundbs.mac"
	.global musicptr
	.rodata
musicptr:
	.word CHANNEL_0, CHANNEL_1, CHANNEL_2, CHANNEL_3

PATTERN_LENGTH   .set  1280

CHANNEL_0:
	PATTERN ENVIROS
	PATTERN PATTERN_00
CHAN_STOP

CHANNEL_1:
	PATTERN ENVIROS
	PATTERN PATTERN_01
CHAN_STOP

CHANNEL_2:
	PATTERN ENVIROS
	PATTERN PATTERN_02
CHAN_STOP

CHANNEL_3:
	PATTERN ENVIROS
	PATTERN PATTERN_03
CHAN_STOP

ENVIROS:
	SETPLAYERFREQ $9D,129
	DEF_VOLENV 1,TREMOLO_1
	DEF_WAVEENV 1,WAVEENV_1
	DEF_VOLENV 2,TREMOLO_2
	DEF_WAVEENV 2,WAVEENV_2
	DEF_VOLENV 3,TREMOLO_3
	DEF_VOLENV 4,TREMOLO_4
	DEF_VOLENV 5,TREMOLO_5
	DEF_VOLENV 6,TREMOLO_6
	DEF_VOLENV 8,TREMOLO_8
	DEF_VOLENV 9,TREMOLO_9
	DEF_WAVEENV 9,WAVEENV_9
	DELAY 3
RETURN

TREMOLO_1:
.byte $02,$05,$0D,$00,$06,$00,$02,$F6,$10,$00,$01,$FA
WAVEENV_1:
.byte 0,2,6,$f0,$0,$b3,6,$f3,$30,$a2
TREMOLO_2:
.byte $02,$06,$02,$0F,$06,$00,$02,$FC,$06,$00,$01,$FC,$02,$05
WAVEENV_2:
.byte 1,2,15,$53,$30,$a2,15,$71,$10,$a2
TREMOLO_3:
.byte $02,$02,$0B,$00,$01,$F6
TREMOLO_4:
.byte $02,$02,$10,$00,$01,$EC
TREMOLO_5:
.byte $02,$02,$05,$00,$01,$FB
TREMOLO_6:
.byte $02,$02,$05,$00,$01,$FB
TREMOLO_8:
.byte $02,$02,$29,$00,$01,$FF
TREMOLO_9:
.byte $02,$02,$29,$00,$01,$FF
WAVEENV_9:
.byte 2,2,20,$48,$10,$80,100,$bd,$0,$d0



PATTERN_00:
	DELAY 1280
RETURN


PATTERN_01:
	DELAY 1280
RETURN


PATTERN_02:
	DELAY 1280
RETURN


PATTERN_03:
	DELAY 1280
RETURN
