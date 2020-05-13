# File:		Lavrinc_testutils.asm
# Author:	Samantha Lavrinc
# Purpose:	DEMO file to test Lavrinc_utils.asm
	
.text
main:
jal Prompt
jal Mult10
jal Space
jal RCS
jal Space
jal PBit
jal Space
jal LCS
jal Space
jal PBit
jal Space
jal Exit

.data
.include "Lavrinc_utils.asm"
