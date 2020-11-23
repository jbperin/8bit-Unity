
;;; source file for CC65 "remake" compiler
	.include "soundbs.mac"
	.global musicptr
	.rodata
musicptr:
	.word CHANNEL_0, CHANNEL_1, CHANNEL_2, CHANNEL_3

PATTERN_LENGTH   .set  2304

CHANNEL_0:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_00
	PATTERN PATTERN_09
  LOOP
CHAN_STOP

CHANNEL_1:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_01
	PATTERN PATTERN_05
	PATTERN PATTERN_05
	PATTERN PATTERN_05
	PATTERN PATTERN_02
	PATTERN PATTERN_05
	PATTERN PATTERN_01
	PATTERN PATTERN_05
	PATTERN PATTERN_05
	PATTERN PATTERN_10
  LOOP
CHAN_STOP

CHANNEL_2:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_02
	PATTERN PATTERN_06
	PATTERN PATTERN_06
	PATTERN PATTERN_06
	PATTERN PATTERN_06
	PATTERN PATTERN_06
	PATTERN PATTERN_02
	PATTERN PATTERN_06
	PATTERN PATTERN_06
	PATTERN PATTERN_02
  LOOP
CHAN_STOP

CHANNEL_3:
  DO 0
	PATTERN ENVIROS
	PATTERN PATTERN_02
	PATTERN PATTERN_02
	PATTERN PATTERN_03
	PATTERN PATTERN_04
	PATTERN PATTERN_04
	PATTERN PATTERN_07
	PATTERN PATTERN_04
	PATTERN PATTERN_04
	PATTERN PATTERN_07
	PATTERN PATTERN_08
  LOOP
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
	DEF_WAVEENV 6,WAVEENV_6
	DEF_VOLENV 7,TREMOLO_7
	DEF_WAVEENV 7,WAVEENV_7
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
.byte $02,$02,$51,$00,$01,$FF
WAVEENV_6:
.byte 1,3,8,$28,$0,$5d,8,$f0,$0,$80,8,$69,$10,$4c
TREMOLO_7:
.byte $02,$02,$33,$00,$01,$FF
WAVEENV_7:
.byte 1,3,5,$c0,$0,$2,5,$a,$0,$10,10,$69,$10,$4c
TREMOLO_8:
.byte $02,$02,$29,$00,$01,$FF
TREMOLO_9:
.byte $02,$02,$29,$00,$01,$FF
WAVEENV_9:
.byte 2,2,20,$48,$10,$80,100,$bd,$0,$d0



PATTERN_00:
	INSTR2 $f3,$30,$a2,56,127
	SET_VOLENV 1
	SET_WAVEENV 1
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 219,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
	PLAY2 195,$7a,72
RETURN


PATTERN_01:
	DELAY 2016
	INSTR2 $60,$20,$7b,56,127
	SET_VOLENV 5
	PLAY2 1,$5b,36
	PLAY2 1,$5b,36
	PLAY2 5,$58,36
	PLAY2 5,$58,36
	PLAY2 1,$5b,36
	PLAY2 1,$5b,36
	PLAY2 5,$58,36
	PLAY2 5,$58,36
RETURN


PATTERN_02:
	DELAY 2304
RETURN


PATTERN_03:
	INSTR2 $28,$00,$5d,68,127
	SET_VOLENV 6
	SET_WAVEENV 6
	PLAY2 195,$79,255
	DELAY 321
	PLAY2 164,$79,255
	DELAY 321
	PLAY2 146,$79,255
	DELAY 321
	PLAY2 130,$79,255
	DELAY 321
RETURN


PATTERN_04:
	INSTR2 $28,$00,$5d,68,127
	SET_VOLENV 6
	SET_WAVEENV 6
	PLAY2 195,$79,255
	DELAY 249
	PLAY2 184,$79,36
	PLAY2 174,$79,36
	PLAY2 164,$79,255
	DELAY 321
	PLAY2 146,$79,255
	DELAY 249
	PLAY2 146,$79,36
	PLAY2 138,$79,36
	PLAY2 130,$79,255
	DELAY 321
RETURN


PATTERN_05:
	INSTR2 $60,$20,$7b,56,127
	SET_VOLENV 5
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 2,$5a,72
	PLAY2 4,$59,72
	PLAY2 2,$5a,72
	PLAY2 4,$59,72
	PLAY2 2,$5a,72
	PLAY2 4,$59,72
	PLAY2 2,$5a,72
	PLAY2 4,$59,72
	PLAY2 10,$58,72
	PLAY2 8,$58,72
	PLAY2 10,$58,72
	PLAY2 8,$58,72
	PLAY2 10,$58,72
	PLAY2 8,$58,72
	PLAY2 10,$58,72
	PLAY2 8,$58,72
RETURN


PATTERN_06:
	DELAY 36
	INSTR2 $71,$10,$a2,1,127
	SET_VOLENV 2
	SET_WAVEENV 2
	PLAY2 232,$7a,72
	PLAY2 232,$7a,108
	PLAY2 232,$7a,108
	PLAY2 232,$7a,72
	PLAY2 232,$7a,108
	PLAY2 232,$7a,108
	PLAY2 219,$7a,72
	PLAY2 219,$7a,108
	PLAY2 219,$7a,108
	PLAY2 219,$7a,72
	PLAY2 219,$7a,108
	PLAY2 219,$7a,108
	PLAY2 174,$7a,72
	PLAY2 174,$7a,108
	PLAY2 174,$7a,108
	PLAY2 174,$7a,72
	PLAY2 174,$7a,108
	PLAY2 174,$7a,108
	PLAY2 38,$7c,72
	PLAY2 38,$7c,108
	PLAY2 38,$7c,108
	PLAY2 38,$7c,72
	PLAY2 38,$7c,108
	PLAY2 38,$7c,72
RETURN


PATTERN_07:
	INSTR2 $28,$00,$5d,68,127
	SET_VOLENV 6
	SET_WAVEENV 6
	PLAY2 195,$78,144
	PLAY2 195,$78,255
	DELAY 105
	PLAY2 184,$78,36
	PLAY2 174,$78,36
	PLAY2 164,$78,144
	PLAY2 164,$78,255
	DELAY 177
	PLAY2 146,$78,144
	PLAY2 146,$78,255
	DELAY 105
	PLAY2 146,$78,36
	PLAY2 138,$78,36
	PLAY2 130,$78,144
	PLAY2 130,$79,144
	PLAY2 138,$79,144
	PLAY2 146,$79,144
RETURN


PATTERN_08:
	INSTR2 $28,$00,$5d,68,127
	SET_VOLENV 6
	SET_WAVEENV 6
	PLAY2 195,$78,255
	DELAY 249
	PLAY2 12,$7c,36
	PLAY2 219,$78,36
	PLAY2 164,$78,255
	DELAY 249
	PLAY2 174,$78,36
	PLAY2 184,$78,36
	PLAY2 195,$78,255
	DELAY 249
	PLAY2 12,$7c,36
	PLAY2 219,$78,36
	PLAY2 232,$78,255
	DELAY 321
RETURN


PATTERN_09:
	INSTR2 $f3,$30,$a2,56,127
	SET_VOLENV 1
	SET_WAVEENV 1
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 146,$7b,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 246,$7a,72
	PLAY2 138,$7b,255
	DELAY 897
RETURN


PATTERN_10:
	INSTR2 $60,$20,$7b,56,127
	SET_VOLENV 5
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 1,$5b,72
	PLAY2 12,$58,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 14,$58,72
	PLAY2 2,$5a,72
	PLAY2 2,$5a,255
	DELAY 897
RETURN