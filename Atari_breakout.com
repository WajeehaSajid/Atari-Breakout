[org 0x0100]

jmp Main_Entry_Point 

first_run:      db 0            
game_over_flag: db 0            
score:          dw -10
highscore:      dw 0              
filename:       db 'high.bin', 0  
filehandle:     dw 0

timercount:     db 0
sec:            db 0
min:            db 0
counter:        db 0
press1:         db 'Press any key to Exit',0
over:           db 'Game Over',0
gamer:          db 0
oldisr:         dd 0
oldtimer:       dd 0             
boardcolor:     db 0x70           
boardbool2:     db 0

flag:           db 0
ballrow:        db 0x0C
ballcol:        db 0x28
ballrowspace:   db 0x0C
ballcolspace:   db 0x28
aballrow:       db 0x0D
aballcol:       db 0x28
ball:           dw 0x01
flag1:          db 0
spaceflag:      db 0
rowflag:        db 0
colflag:        db 0
midflag:        db 0
rightcolflag:   db 0
leftcolflag:    db 0
boardleft:      db 0
boardright:     db 0
life:           db '321'
gamecounter:    db 0
boxcount:       db 0
boxcount1:      db 0
boxcount2:      db 0
boxcount3:      db 0              
gre:            db 25

current_level:  db 1
speed_delay:    db 4              
base_speed:     db 4              
str_lvl:        db 'Lvl:', 0

powerup_status: db 0              
powerup_timer:  dw 0              
str_2x:         db '2X  ', 0
str_empty:      db '    ', 0

item_active:    db 0              
item_row:       db 0
item_col:       db 0
item_type:      db 0              
item_char_2x:   db '2x'           
item_char_life: db 'L'

data_region_start:

Boardposition:  dw 0x171B,0x171C,0x171D,0x171E,0x171F,0x1720,0x1721,0x1722,0x1723,0x1724,0x171B,0x171C,0x171D,0x171E,0x171F,0x1720,0x1721,0x1722,0x1723,0x1724,0x171B,0x171C,0x171D,0x1724

boolbox1:db 0
box1: dw 0x0101,0x0102,0x0103,0x0104,0x0105,0x0106,0x0107,0x0108,0x0109,0x010A,0x010B,0x010C,0x0201,0x0202,0x0203,0x0204,0x0205,0x0206,0x0207,0x0208,0x0209,0x020A,0x020B,0x020C
boolbox2:db 0
box2: dw 0x010E,0x010F,0x0110,0x0111,0x0112,0x0113,0x0114,0x0115,0x0116,0x0117,0x0118,0x0119,0x020E,0x020F,0x0210,0x0211,0x0212,0x0213,0x0214,0x0215,0x0216,0x0217,0x0218,0x0219
boolbox3:db 0
box3: dw 0x011B,0x011C,0x011D,0x011E,0x011F,0x0120,0x0121,0x0122,0x0123,0x0124,0x0125,0x0126,0x021B,0x021C,0x021D,0x021E,0x021F,0x0220,0x0221,0x0222,0x0223,0x0224,0x0225,0x0226
boolbox4:db 0
box4: dw 0x0128,0x0129,0x012A,0x012B,0x012C,0x012D,0x012E,0x012F,0x0130,0x0131,0x0132,0x0133,0x0228,0x0229,0x022A,0x022B,0x022C,0x022D,0x022E,0x022F,0x0230,0x0231,0x0232,0x0233
boolbox5:db 0
box5: dw 0x0135,0x0136,0x0137,0x0138,0x0139,0x013A,0x013B,0x013C,0x013D,0x013E,0x013F,0x0140,0x0235,0x0236,0x0237,0x0238,0x0239,0x023A,0x023B,0x023C,0x023D,0x023E,0x023F,0x0240
boolbox6:db 0
box6: dw 0x0142,0x0143,0x0144,0x0145,0x0146,0x0147,0x0148,0x0149,0x014A,0x014B,0x014C,0x014D,0x0242,0x0243,0x0244,0x0245,0x0246,0x0247,0x0248,0x0249,0x024A,0x024B,0x024C,0x024D
color1: db 0x10       

boolbox7:db 0
box7: dw 0x0401,0x0402,0x0403,0x0404,0x0405,0x0406,0x0407,0x0408,0x0409,0x040A,0x040B,0x040C,0x0501,0x0502,0x0503,0x0504,0x0505,0x0506,0x0507,0x0508,0x0509,0x050A,0x050B,0x050C
boolbox8:db 0
box8: dw 0x040E,0x040F,0x0410,0x0411,0x0412,0x0413,0x0414,0x0415,0x0416,0x0417,0x0418,0x0419,0x050E,0x050F,0x0510,0x0511,0x0512,0x0513,0x0514,0x0515,0x0516,0x0517,0x0518,0x0519
boolbox9:db 0
box9: dw 0x041B,0x041C,0x041D,0x041E,0x041F,0x0420,0x0421,0x0422,0x0423,0x0424,0x0425,0x0426,0x051B,0x051C,0x051D,0x051E,0x051F,0x0520,0x0521,0x0522,0x0523,0x0524,0x0525,0x0526
boolbox10:db 0
box10: dw 0x0428,0x0429,0x042A,0x042B,0x042C,0x042D,0x042E,0x042F,0x0430,0x0431,0x0432,0x0433,0x0528,0x0529,0x052A,0x052B,0x052C,0x052D,0x052E,0x052F,0x0530,0x0531,0x0532,0x0533
boolbox11:db 0
box11: dw 0x0435,0x0436,0x0437,0x0438,0x0439,0x043A,0x043B,0x043C,0x043D,0x043E,0x043F,0x0440,0x0535,0x0536,0x0537,0x0538,0x0539,0x053A,0x053B,0x053C,0x053D,0x053E,0x053F,0x0540
boolbox12:db 0
box12: dw 0x0442,0x0443,0x0444,0x0445,0x0446,0x0447,0x0448,0x0449,0x044A,0x044B,0x044C,0x044D,0x0542,0x0543,0x0544,0x0545,0x0546,0x0547,0x0548,0x0549,0x054A,0x054B,0x054C,0x054D
color2: db 0x20     

boolbox13:db 0
box13: dw 0x0701,0x0702,0x0703,0x0704,0x0705,0x0706,0x0707,0x0708,0x0709,0x070A,0x070B,0x070C,0x0801,0x0802,0x0803,0x0804,0x0805,0x0806,0x0807,0x0808,0x0809,0x080A,0x080B,0x080C
boolbox14:db 0
box14: dw 0x070E,0x070F,0x0710,0x0711,0x0712,0x0713,0x0714,0x0715,0x0716,0x0717,0x0718,0x0719,0x080E,0x080F,0x0810,0x0811,0x0812,0x0813,0x0814,0x0815,0x0816,0x0817,0x0818,0x0819
boolbox15:db 0
box15: dw 0x071B,0x071C,0x071D,0x071E,0x071F,0x0720,0x0721,0x0722,0x0723,0x0724,0x0725,0x0726,0x081B,0x081C,0x081D,0x081E,0x081F,0x0820,0x0821,0x0822,0x0823,0x0824,0x0825,0x0826
boolbox16:db 0
box16: dw 0x0728,0x0729,0x072A,0x072B,0x072C,0x072D,0x072E,0x072F,0x0730,0x0731,0x0732,0x0733,0x0828,0x0829,0x082A,0x082B,0x082C,0x082D,0x082E,0x082F,0x0830,0x0831,0x0832,0x0833
boolbox17:db 0
box17: dw 0x0735,0x0736,0x0737,0x0738,0x0739,0x073A,0x073B,0x073C,0x073D,0x073E,0x073F,0x0740,0x0835,0x0836,0x0837,0x0838,0x0839,0x083A,0x083B,0x083C,0x083D,0x083E,0x083F,0x0840
boolbox18:db 0
box18: dw 0x0742,0x0743,0x0744,0x0745,0x0746,0x0747,0x0748,0x0749,0x074A,0x074B,0x074C,0x074D,0x0842,0x0843,0x0844,0x0845,0x0846,0x0847,0x0848,0x0849,0x084A,0x084B,0x084C,0x084D
color3: db 0x40       

boolbox19:db 0
box19: dw 0x0A01,0x0A02,0x0A03,0x0A04,0x0A05,0x0A06,0x0A07,0x0A08,0x0A09,0x0A0A,0x0A0B,0x0A0C,0x0B01,0x0B02,0x0B03,0x0B04,0x0B05,0x0B06,0x0B07,0x0B08,0x0B09,0x0B0A,0x0B0B,0x0B0C
boolbox20:db 0
box20: dw 0x0A0E,0x0A0F,0x0A10,0x0A11,0x0A12,0x0A13,0x0A14,0x0A15,0x0A16,0x0A17,0x0A18,0x0A19,0x0B0E,0x0B0F,0x0B10,0x0B11,0x0B12,0x0B13,0x0B14,0x0B15,0x0B16,0x0B17,0x0B18,0x0B19
boolbox21:db 0
box21: dw 0x0A1B,0x0A1C,0x0A1D,0x0A1E,0x0A1F,0x0A20,0x0A21,0x0A22,0x0A23,0x0A24,0x0A25,0x0A26,0x0B1B,0x0B1C,0x0B1D,0x0B1E,0x0B1F,0x0B20,0x0B21,0x0B22,0x0B23,0x0B24,0x0B25,0x0B26
boolbox22:db 0
box22: dw 0x0A28,0x0A29,0x0A2A,0x0A2B,0x0A2C,0x0A2D,0x0A2E,0x0A2F,0x0A30,0x0A31,0x0A32,0x0A33,0x0B28,0x0B29,0x0B2A,0x0B2B,0x0B2C,0x0B2D,0x0B2E,0x0B2F,0x0B30,0x0B31,0x0B32,0x0B33
boolbox23:db 0
box23: dw 0x0A35,0x0A36,0x0A37,0x0A38,0x0A39,0x0A3A,0x0A3B,0x0A3C,0x0A3D,0x0A3E,0x0A3F,0x0A40,0x0B35,0x0B36,0x0B37,0x0B38,0x0B39,0x0B3A,0x0B3B,0x0B3C,0x0B3D,0x0B3E,0x0B3F,0x0B40
boolbox24:db 0
box24: dw 0x0A42,0x0A43,0x0A44,0x0A45,0x0A46,0x0A47,0x0A48,0x0A49,0x0A4A,0x0A4B,0x0A4C,0x0A4D,0x0B42,0x0B43,0x0B44,0x0B45,0x0B46,0x0B47,0x0B48,0x0B49,0x0B4A,0x0B4B,0x0B4C,0x0B4D
color4: db 0x30       

data_region_end:

Main_Entry_Point:
    cmp byte [cs:first_run], 1
    je .skip_backup
    
    push ds
    push es
    push cx
    push si
    push di
    
    mov si, data_region_start
    mov di, bricks_backup
    mov cx, data_region_end - data_region_start
    cld
    rep movsb
    
    pop di
    pop si
    pop cx
    pop es
    pop ds
    
    mov byte [cs:first_run], 1
.skip_backup:
    
    call LoadHighScore    
    call startpage
    call Draw_Initial_Paddle
    
    mov ax, 10
    call Update_Score
    
    call Draw_All_Bricks
    jmp start

Draw_Initial_Paddle:
	pusha
	mov si,0
.loop_paddle:
    mov ah, 0x13 
    mov al, 0    
    mov bh, 0    
    mov bl, [cs:boardcolor] 
    mov cx, 1    
    mov dx,[Boardposition+si]
    push cs
    pop es       
    mov bp, ' '  
    int 0x10     
    add si,2
    cmp si,48
    jne .loop_paddle
    popa
    ret

Draw_Single_Brick_Row:
    push bp
    mov bp,sp
	pusha
    mov si,0
.brick_loop:
    mov bx,[bp+4]
    mov dx,[bx+si]
    add si,2
    mov ah, 0x13 
    mov al, 0    
    mov bh, 0    
    mov bl, [bp+6]
    mov cx, 1    
    push bp
    push cs
    mov bp,' '   
    pop es       
    int 0x10     
    pop bp
    cmp si,48
    jne .brick_loop
    popa
    pop bp
    ret 

Draw_Ball_Only:
    pusha
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, 7 
    mov cx, 1 
    mov dh, [cs:ballrow]
    mov dl, [cs:ballcol]
    push cs
    pop es
    mov bp, ball 
    int 0x10 
    popa
    ret

Draw_All_Bricks:
    pusha
    mov cx,1
.color_loop:
    cmp cx,6
    jg .check_row2
    push word[color1]
    jmp .l1color
.check_row2:
    cmp cx,12
    jg .check_row3
    push word[color2]
    jmp .l1color
.check_row3:
    cmp cx,18
    jg .check_row4
    push word[color3]
    jmp .l1color
.check_row4:
    push word[color4]

.l1color:
    cmp cx, 12
    jle .lower_12_checks  
    jmp .check_upper_12   

.lower_12_checks:
    cmp cx,1
    je .b1
    cmp cx,2
    je .b2
    cmp cx,3
    je .b3
    cmp cx,4
    je .b4
    cmp cx,5
    je .b5
    cmp cx,6
    je .b6
    cmp cx,7
    je .b7
    cmp cx,8
    je .b8
    cmp cx,9
    je .b9
    cmp cx,10
    je .b10
    cmp cx,11
    je .b11
    cmp cx,12
    je .b12
    jmp .back  

.b1: push box1   
    jmp .back
.b2: push box2 
    jmp .back
.b3: push box3    
    jmp .back
.b4: push box4  
    jmp .back
.b5: push box5  
    jmp .back
.b6: push box6    
    jmp .back
.b7: push box7    
    jmp .back
.b8: push box8 
    jmp .back
.b9: push box9    
    jmp .back
.b10:push box10  
    jmp .back
.b11:push box11  
    jmp .back
.b12:push box12    
    jmp .back

.check_upper_12:
    cmp cx,13
    je .b13
    cmp cx,14
    je .b14
    cmp cx,15
    je .b15
    cmp cx,16
    je .b16
    cmp cx,17
    je .b17
    cmp cx,18
    je .b18
    cmp cx,19
    je .b19
    cmp cx,20
    je .b20
    cmp cx,21
    je .b21
    cmp cx,22
    je .b22
    cmp cx,23
    je .b23
    cmp cx,24
    je .b24
    jmp .back

.b13:push box13    
    jmp .back
.b14:push box14 
    jmp .back
.b15:push box15
    jmp .back
.b16:push box16  
    jmp .back
.b17:push box17  
    jmp .back
.b18:push box18  
    jmp .back
.b19:push box19
    jmp .back
.b20:push box20
    jmp .back
.b21:push box21
    jmp .back
.b22:push box22
    jmp .back
.b23:push box23
    jmp .back
.b24:push box24
    jmp .back

.back:
    call Draw_Single_Brick_Row
    inc cx
    pop bx
    pop dx
    cmp cx,24       
    jle .color_loop
    popa
    ret 

PlaySound:
    pusha
    
    mov bx, ax          
    mov dx, 0x0012
    mov ax, 0x34DC
    div bx              
    mov bx, ax          
    
    mov al, 0xB6        
    out 0x43, al
    
    mov ax, bx
    out 0x42, al        
    mov al, ah
    out 0x42, al        
    
    in al, 0x61
    or al, 0x03         
    out 0x61, al
    
.sound_wait:
    dec cx
    jnz .sound_wait
    
    in al, 0x61
    and al, 0xFC        
    out 0x61, al
    
    popa
    ret

Keyboard_ISR:
    pusha
    xor ax, ax
    in al,0x60
    
    cmp al, 0x4d 
    jz .move_right
    cmp al,0x4b  
    jz .move_left
    jmp .exit_isr
	
.move_right:
    mov byte[boardbool2],1
	
.move_left:
    mov ax, word[cs:boardcolor] 
    mov cx, Boardposition
    push ax
    push cx
    call Update_Paddle_Position
    pop cx 
    pop ax
.exit_isr:
    popa
    jmp far [cs:oldisr]

partner1: db 'MEERAB FATIMA (24F-0729)',0
partner2: db 'WAJEEHA SAJID (24F-0806)',0
title_str1: db 'ATARI BREAKOUT',0
title_str2: db 'ARCADE GAME',0

rule_header:   db '== GAME RULES ==', 0
rule_obj:      db 'Break all bricks!', 0
rule_controls: db 'Controls: Left/Right Arrows', 0
rule_score:    db 'Score: 10 pts per brick', 0
rule_lives:    db 'Lives: 3', 0
rule_start:    db 'Press ENTER to Start Game', 0
rule_exit:     db 'Press ESC to Exit Program', 0

str_game_over: db 'GAME OVER', 0
str_win: db '==WOHOO YOU WON==', 0
str_lose: db '==YOU LOSE==', 0
str_score: db 'Score: ', 0
str_time: db 'Time: ', 0
str_lives: db 'Lives: ', 0
str_play_again: db 'Press ENTER to PLAY AGAIN', 0
str_quit: db 'Press ESCAPE to QUIT', 0

startpage:
    pusha
    mov ah, 06h    
    xor al, al     
    xor cx, cx     
    mov dx, 184fh  
    mov bh, 07h    
    int 10h        

    mov ah, 0x13 
    mov al, 1    
    mov bh, 0    
    mov bl, 0x0C 
    mov cx, 14   
    mov dx, 0x0321 
    push cs
    pop es 
    mov bp, title_str1
    int 0x10

    mov ah, 0x13 
    mov al, 1 
    mov bh, 0 
    mov bl, 0x0C 
    mov cx, 11 
    mov dx, 0x0522 
    push cs
    pop es 
    mov bp, title_str2
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov bh, 0
    mov bl, 0x0F 
    mov cx, 24
    mov dx, 0x081C 
    push cs
    pop es 
    mov bp, partner1
    int 0x10 

    mov ah, 0x13 
    mov al, 1 
    mov bh, 0 
    mov bl, 0x0F 
    mov cx, 24 
    mov dx, 0x091C 
    push cs
    pop es 
    mov bp, partner2 
    int 0x10 

    mov ah, 0x13 
    mov al, 1 
    mov bh, 0 
    mov bl, 0x0E 
    mov cx, 16
    mov dx, 0x0C20 
    mov bp, rule_header
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov bl, 0x07 
    mov cx, 17
    mov dx, 0x0E1E
    mov bp, rule_obj
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov cx, 27
    mov dx, 0x0F19
    mov bp, rule_controls
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov cx, 23
    mov dx, 0x101B
    mov bp, rule_score
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov cx, 8
    mov dx, 0x1123
    mov bp, rule_lives
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov bl, 0x0A 
    mov cx, 25
    mov dx, 0x141B
    mov bp, rule_start
    int 0x10

    mov ah, 0x13
    mov al, 1
    mov bl, 0x04 
    mov cx, 25
    mov dx, 0x151B
    mov bp, rule_exit
    int 0x10

.wait_for_start_input:
    mov ah, 0
    int 16h
    cmp al, 13   
    je .start_selected
    
    cmp al, 27   
    je .exit_selected
    
    jmp .wait_for_start_input

.exit_selected:
    MOV AH, 06h
    XOR AL, AL
    XOR CX, CX
    MOV DX, 184FH
    MOV BH, 07h
    INT 10H
    mov ax, 0x4c00
    int 0x21

.start_selected:
    MOV AH, 06h
    XOR AL, AL
    XOR CX, CX
    MOV DX, 184FH
    MOV BH, 07h
    INT 10H
    popa
    ret

Update_Paddle_Position:
    push bp
    mov bp,sp
    pusha
    xor ax, ax
    xor si, si
.loop_paddle_draw:
    mov bx,[bp+4]
    mov dx,[bx+si]
    cmp byte[boardbool2],1
    jz .moving_right
    jmp .moving_left
	
.moving_right:
    cmp word[bx+46],0x174f 
    je .exit_paddle_draw
    jmp .apply_move
.moving_left:
    cmp dx,0x1700          
    je .exit_paddle_draw

.apply_move:
    mov bx,Boardposition
    cmp byte[boardbool2],1
    jz .add_col
    sub dl,1  
    jmp .update_mem
.add_col:
    add dl,1  
.update_mem:
    mov word [bx+si],dx
    add si,2
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, [bp+6] 
    mov cx, 1 
    push bp
    push cs
    mov bp,' ' 
    pop es 
    int 0x10 
    pop bp
    cmp si,48
    jne .loop_paddle_draw
    mov si,46
.space1:
    cmp byte[boardbool2],0
    jz .erase_right_side
.erase_left_side:
    mov bx,[bp+4]
    mov dx,[bx+0]
    sub dl,1
    jmp .erase_do
.erase_right_side:
    mov bx,[bp+4]
    mov dx,[bx+si]
    add dl,1
.erase_do:
    add si,2
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, 7 
    mov cx,1
    push bp
    push cs
    mov bp,' ' 
    pop es 
    int 0x10 
    pop bp
    cmp si,48
    jne .erase_right_side

.exit_paddle_draw:
    mov byte[boardbool2],0
    popa
    pop bp
    ret 

Timer_ISR_GameLoop:
    pusha
    cmp byte [cs:gamer],24
    je .do_next_level

    cmp byte[cs:gamecounter],3
    je .game_over

    cmp word [cs:powerup_timer], 0
    je .skip_powerup_timer
    dec word [cs:powerup_timer]
    jnz .skip_powerup_timer
    
    mov byte [cs:powerup_status], 0
    mov al, [cs:base_speed]
    mov [cs:speed_delay], al    
    
    mov ax, 0xb800
    mov es, ax
    mov di, 3990
    mov si, str_empty
    mov cx, 4
    mov ah, 0x07
.clean_hud:
    lodsb
    stosw
    loop .clean_hud

.skip_powerup_timer:

    inc byte[cs:timercount]
    inc byte[counter]
    cmp byte[cs:timercount],18
    je .increment_seconds
.sec_ret:
    cmp byte[cs:sec],59
    je .increment_minutes
.min_ret:
    mov al, [cs:speed_delay] 
    cmp byte [cs:item_active], 1
    jne .check_speed
    mov al, 8               
.check_speed:
    cmp byte [counter], al
    jne .exit_timer
    
    mov ax,0x10
    push ax
    mov bx,ballrow
    push bx
    mov di,ballcol
    push di
    call Update_Ball_And_Physics
    pop di
    pop bx
    pop ax
    
    call Update_Falling_Item
    
    jmp .exit_timer

.do_next_level:
    call NextLevel
    jmp .exit_timer

.game_over:
    mov byte [cs:game_over_flag], 1
    mov byte[cs:gamer],0

.exit_timer:
    popa
    mov al,0x20
    out 0x20,al
    iret
.increment_seconds:
    inc byte[cs:sec]
    mov byte[cs:timercount],0
    jmp .sec_ret
.increment_minutes:
    inc byte[cs:min]
    mov byte[cs:sec],0
    jmp .min_ret

Update_Ball_And_Physics:
    mov byte[counter],1
    push bp
    mov bp,sp
    pusha
    
    mov ax,0xb800
    mov es,ax
    mov ah,0x04
    mov al,25
    mov di,3840
    mov byte[es:di],'L'
    mov byte[es:di+2],'I'
    mov byte[es:di+4],'F'
    mov byte[es:di+6],'E'
    mov al,byte[life]
    mov byte[es:di+10],al
    mov ah,0x07
    mov di,3950
    mov byte[es:di],'T'
    mov byte[es:di+2],'I'
    mov byte[es:di+4],'M'
    mov byte[es:di+6],'E'
    mov byte[es:di+8],'R'
    mov al,[cs:min]
    add al,0x30
    mov byte [es:di+12],al
    mov byte [es:di+14],':'
    mov al,[cs:sec]
    mov dl,10
    xor ah,ah
    div dl
    mov cl,ah
    mov ah,0x07
    add al,0x30
    mov byte [es:di+16],al
    add cl,0x30
    mov byte [es:di+18],cl

    mov di, 3880
    mov byte[es:di], 'L'
    mov byte[es:di+2], 'V'
    mov byte[es:di+4], 'L'
    mov byte[es:di+6], ':'
    mov al, [cs:current_level]
    add al, 0x30
    mov byte[es:di+8], al
    
    mov di, 3860
    mov byte[es:di], 'H'
    mov byte[es:di+2], 'I'
    mov byte[es:di+4], ':'
    mov ax, [cs:highscore]
    mov bx, 100
    xor dx, dx
    div bx        
    add al, 0x30
    mov byte[es:di+6], al
    
    mov ax, dx
    mov bl, 10
    div bl        
    add al, 0x30
    mov byte[es:di+8], al
    add ah, 0x30
    mov byte[es:di+10], ah

    mov di, 3990
    cmp byte [cs:powerup_status], 1
    je .draw_2x
    jmp .skip_power_draw
.draw_2x:
    mov si, str_2x
    mov ah, 0x0E 
    jmp .do_draw_p
.do_draw_p:
    mov cx, 4
.p_loop:
    lodsb
    stosw
    loop .p_loop
.skip_power_draw:

.space23:
    cmp byte[cs:flag],1
    je .inn
    jmp .inn2
.inn:
    inc dh
.inn2:
    dec dh
    mov dh,byte[cs:ballrowspace]
    mov dl,byte[cs:ballcolspace]
    
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, 0x07
    mov cx, 1 
    push bp
    push cs
    mov bp," " 
    pop es 
    int 0x10 
    pop bp

    mov si,0
    mov bx,[bp+6]
    mov dh,byte[cs:ballrow]
    mov bx,[bp+4]
    mov dl,byte[cs:ballcol]
    mov byte[cs:ballrowspace],dh
    mov byte[cs:ballcolspace],dl

.inn24:
    cmp byte[cs:flag],1
    je .ball_going_down
    
    inc byte[cs:ballrow]
    cmp byte[cs:midflag],1
    je .mid_check 
    cmp byte[cs:boardright],1
    je .br_right
    cmp byte[cs:boardleft],1
    je .br_left
    cmp byte[cs:rightcolflag],1
    je .col_r
    cmp byte[cs:leftcolflag],1
    je .col_l
    jmp .def_move
.br_right: 
    inc byte [cs:ballcol]
    jmp .draw_ball
.br_left:  
    dec byte [cs:ballcol]
    jmp .draw_ball
.col_r:
    dec byte [cs:ballcol]
    jmp .draw_ball
.col_l:
    inc byte [cs:ballcol]
    jmp .draw_ball
.def_move:
.mid_check: 
    jmp .draw_ball

.ball_going_down:   
    dec byte [cs:ballrow] 
    cmp byte[midflag],1
    je .draw_ball 
    cmp byte[cs:boardright],1
    je .bd_right
    cmp byte[cs:boardleft],1
    je .bd_left
    cmp byte[midflag],1
    cmp byte[rightcolflag],1
    je .bd_r_col
    cmp byte[leftcolflag],1
    je .bd_l_col
    jmp .bd_def

.bd_right:
    inc byte [cs:ballcol]
    jmp .draw_ball
.bd_left:
    dec byte [cs:ballcol]
    jmp .draw_ball
.bd_l_col:
    inc byte[cs:ballcol]
    jmp .draw_ball
.bd_r_col:
    dec byte [cs:ballcol]
    jmp .draw_ball
.bd_def:
    inc byte[cs:ballcol]

.draw_ball:
    add si,2
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, 7 
    mov cx, 1 
    push bp
    push cs
    mov bp,ball 
    pop es 
    int 0x10 
    pop bp
    
    cmp dh,0x16
    mov si,0
    je .check_paddle_hit
    cmp dh,0x18
    je .check_bottom_hit
    jmp .check_walls

.check_paddle_hit:
    mov byte[flag1],1
    mov bx,Boardposition
    mov cx,word[bx+si]
    dec ch
    cmp dx,cx
    je .hit_paddle
    add si,2
    jmp .cont_paddle

.hit_paddle:
    sub byte[cs:ballrow],1
    mov byte[flag],1
    
    mov ax, 1000
    mov cx, 0x2000
    call PlaySound

    cmp si,8
    je .hit_mid
    cmp si,10
    je .hit_mid
    cmp si,0
    je .hit_left
    cmp si,2
    je .hit_left
    cmp si,4
    je .hit_left
    cmp si,6
    je .hit_left
    cmp si,12
    je .hit_right
    cmp si,14
    je .hit_right
    cmp si,16
    je .hit_right
    cmp si,18
    je .hit_right
    jmp .end_hit_checks

.check_bottom_hit:
    cmp dh,0x18
    je .ball_lost
    jmp .check_walls
.hit_left:
    mov byte[cs:midflag],0
    mov byte[cs:boardleft],1
    mov byte[cs:boardright],0
    jmp .end_hit_checks
.hit_right:
    mov byte[cs:midflag],0
    mov byte[cs:boardright],1
    jmp .end_hit_checks
.hit_mid:
    mov byte[cs:midflag],1
.end_hit_checks:
    mov si,48
.cont_paddle:
    cmp si,48
    jne .check_paddle_hit
    cmp  byte[cs:flag1],1
    je .inter
    jmp .check_walls
.inter:
    cmp byte[flag],0
    je .check_bottom_hit
    jmp .check_walls

.ball_lost:
    mov bx,life
    mov ax,0xb800
    mov es,ax
    mov ah,0x07
    mov al,byte[bx]
    dec byte[life]
    inc byte[gamecounter]
    mov di,3840
    mov byte[es:di+10],al
    mov ah,byte [cs:aballrow]
    mov byte[cs:ballrow],ah
    mov ah,byte [cs:aballcol]
    mov byte[cs:ballcol],ah
    mov byte[flag],0
    
    mov ax, 300
    mov cx, 0x8000
    call PlaySound

.check_walls:
    cmp byte dl,0x4e
    je .wall_right
    jmp .check_top
.wall_right:
    mov byte [cs:rightcolflag],1
    mov byte [cs:leftcolflag],0
    mov byte[cs:boardleft],0
    mov byte[cs:boardright],0
.check_top:
    cmp dh,1
    je .wall_top
    jmp .wall_left
.wall_top:
    mov byte [cs:flag],0
.wall_left:
    cmp byte dl,0x02
    je .wall_left_confirm
    jmp Check_Collision_TopRow
.wall_left_confirm:
    mov byte[cs:boardleft],0
    mov byte[cs:boardright],0
    mov byte [cs:leftcolflag],1
    mov byte [cs:rightcolflag],0

Check_Collision_TopRow:
    mov byte[boxcount], 0 
    mov si,0
    cmp dh,0x08        
    je .row_match
    cmp dh,0x07        
    je .row_match
    jmp Check_Collision_MidRow

.row_match:
    cmp byte[boxcount],0
    je .bb18
    cmp byte[boxcount],1
    je .bb17
    cmp byte[boxcount],2
    je .bb16
    cmp byte[boxcount],3
    je .bb15
    cmp byte[boxcount],4
    je .bb14
    cmp byte[boxcount],5
    je .bb13
.bb18: mov bx,box18
    jmp .process_hit
.bb17: mov bx,box17
    jmp .process_hit
.bb16: mov bx,box16
    jmp .process_hit
.bb15: mov bx,box15
    jmp .process_hit
.bb14: mov bx,box14
    jmp .process_hit
.bb13: mov bx,box13

.process_hit:
    inc byte[boxcount]

.loop_hit:
    mov cx,dx
    cmp ch, 0x08 
    je .offset_hit1
    jmp .compare_hit1
.offset_hit1:
    dec ch
.compare_hit1:
    cmp cx,[bx+si]
    jne .skip_found1
    jmp .brick_found
.skip_found1:
    add si,2
    cmp si,48
    jne .loop_hit

    mov si,0
    cmp byte[boxcount],6 
    jne .continue_row1
    jmp Check_Collision_MidRow
.continue_row1:
    jmp .row_match

.brick_found:
    mov ax,7
    push ax
    push bx
    inc byte [cs:gamer]
    call Draw_Single_Brick_Row
    
    mov ax, 20
    call Update_Score
    call AttemptSpawnPowerup  

    mov ax, 2000
    mov cx, 0x1000
    call PlaySound

    cmp byte[flag],0
    je .bounce_down
    cmp byte[flag],1
    je .bounce_up

.bounce_down:
    sub byte[cs:ballrow],3
    cmp byte[cs:ballrow], 1
    jge .check_max1
    mov byte[cs:ballrow], 1
.check_max1:
    mov byte[flag],1
    mov si,0
    jmp .mark_destroyed

.bounce_up:
    inc byte[cs:ballrow]
    mov byte[flag],0
    mov si,0

.mark_destroyed:
    mov word[bx+si],0xFFFF
    add si,2
    cmp si,48
    jne .mark_destroyed
    pop bx
    pop ax
    mov si,0
    call Draw_Ball_Only 
    jmp Check_Collision_MidRow

Check_Collision_MidRow:
    mov byte[boxcount1], 0 
    mov si,0
    cmp dh,0x05        
    je .row_match2
    cmp dh,0x04        
    je .row_match2
    jmp Check_Collision_BotRow

.row_match2:
    cmp byte[boxcount1],0
    je .bb12
    cmp byte[boxcount1],1
    je .bb11
    cmp byte[boxcount1],2
    je .bb10
    cmp byte[boxcount1],3
    je .bb9
    cmp byte[boxcount1],4
    je .bb8
    cmp byte[boxcount1],5
    je .bb7
.bb12: mov bx,box12
    jmp .process_hit2
.bb11: mov bx,box11
    jmp .process_hit2
.bb10: mov bx,box10
    jmp .process_hit2
.bb9:  mov bx,box9
    jmp .process_hit2
.bb8:  mov bx,box8
    jmp .process_hit2
.bb7:  mov bx,box7

.process_hit2:
    inc byte[boxcount1]

.loop_hit2:
    mov cx,dx
    cmp ch, 0x05
    je .offset_hit2
    jmp .compare_hit2
.offset_hit2:
    dec ch
.compare_hit2:
    cmp cx,[bx+si]
    jne .skip_found2
    jmp .brick_found2
.skip_found2:
    add si,2
    cmp si,48
    jne .loop_hit2

    mov si,0
    cmp byte[cs:boxcount1],6 
    jne .continue_row2
    jmp Check_Collision_BotRow
.continue_row2:
    jmp .row_match2

.brick_found2:
    mov ax,7
    push ax
    push bx
    call Draw_Single_Brick_Row
    inc byte [cs:gamer]
    
    mov ax, 30
    call Update_Score
    call AttemptSpawnPowerup  
	
    mov ax, 2000
    mov cx, 0x1000
    call PlaySound

    cmp byte[flag],0
    je .bounce_down2
    cmp byte[flag],1
    je .bounce_up2

.bounce_down2:
    dec byte[cs:ballrow]
    mov byte[flag],1
    mov si,0
    jmp .mark_destroyed2
.bounce_up2:
    inc byte[cs:ballrow]
    mov byte[flag],0
    mov si,0
.mark_destroyed2:
    mov word[bx+si],0xFFFF
    add si,2
    cmp si,48
    jne .mark_destroyed2
    pop bx
    pop ax
    mov si,0
    call Draw_Ball_Only 
    jmp Check_Collision_BotRow

Check_Collision_BotRow:
    mov byte[boxcount2], 0 
    mov si,0
    cmp dh,0x02        
    je .row_match3
    cmp dh,0x01        
    je .row_match3
    jmp .Check_Collision_Row4  

.row_match3:
    cmp byte[boxcount2],0
    je .bb6
    cmp byte[boxcount2],1
    je .bb5
    cmp byte[boxcount2],2
    je .bb4
    cmp byte[boxcount2],3
    je .bb3
    cmp byte[boxcount2],4
    je .bb2
    cmp byte[boxcount2],5
    je .bb1
.bb6: mov bx,box6
    jmp .process_hit3
.bb5: mov bx,box5
    jmp .process_hit3
.bb4: mov bx,box4
    jmp .process_hit3
.bb3: mov bx,box3
    jmp .process_hit3
.bb2: mov bx,box2
    jmp .process_hit3
.bb1: mov bx,box1

.process_hit3:
    inc byte[boxcount2]

.loop_hit3:
    mov cx,dx
    cmp ch, 0x02
    je .offset_hit3
    jmp .compare_hit3
.offset_hit3:
    dec ch
.compare_hit3:
    cmp cx,[bx+si]
    jne .skip_found3
    jmp .brick_found3
.skip_found3:
    add si,2
    cmp si,48
    jne .loop_hit3

    mov si,0
    cmp byte[cs:boxcount2],6 
    jne .continue_row3
    jmp .Check_Collision_Row4
.continue_row3:
    jmp .row_match3

.brick_found3:
    mov ax,7
    push ax
    push bx
    call Draw_Single_Brick_Row
    inc byte [cs:gamer]
    
    mov ax, 40
    call Update_Score
    call AttemptSpawnPowerup  

    mov ax, 2000
    mov cx, 0x1000
    call PlaySound

    cmp byte[flag],0
    je .bounce_down3
    cmp byte[flag],1
    je .bounce_up3

.bounce_down3:
    sub byte[cs:ballrow],2
    cmp byte[cs:ballrow], 1
    jge .bounce_down3_force
    mov byte[cs:ballrow], 1
.bounce_down3_force:
    mov byte[flag],1
    mov si,0
    jmp .mark_destroyed3
.bounce_up3:
    inc byte[cs:ballrow]
    mov byte[flag],0
    mov si,0
.mark_destroyed3:
    mov word[bx+si],0xFFFF
    add si,2
    cmp si,48
    jne .mark_destroyed3
    pop bx
    pop ax
    mov si,0
    call Draw_Ball_Only 
    jmp .Check_Collision_Row4 

.Check_Collision_Row4:
    mov byte[boxcount3], 0 
    mov si,0
    cmp dh,0x0B        
    je .row_match4
    cmp dh,0x0A        
    je .row_match4
    jmp .exit_phys      

.row_match4:
    cmp byte[boxcount3],0
    je .bb24
    cmp byte[boxcount3],1
    je .bb23
    cmp byte[boxcount3],2
    je .bb22
    cmp byte[boxcount3],3
    je .bb21
    cmp byte[boxcount3],4
    je .bb20
    cmp byte[boxcount3],5
    je .bb19
.bb24: mov bx,box24
    jmp .process_hit4
.bb23: mov bx,box23
    jmp .process_hit4
.bb22: mov bx,box22
    jmp .process_hit4
.bb21: mov bx,box21
    jmp .process_hit4
.bb20: mov bx,box20
    jmp .process_hit4
.bb19: mov bx,box19

.process_hit4:
    inc byte[boxcount3]

.loop_hit4:
    mov cx,dx
    cmp ch, 0x0B
    je .offset_hit4
    jmp .compare_hit4
.offset_hit4:
    dec ch
.compare_hit4:
    cmp cx,[bx+si]
    jne .skip_found4
    jmp .brick_found4
.skip_found4:
    add si,2
    cmp si,48
    jne .loop_hit4

    mov si,0
    cmp byte[cs:boxcount3],6 
    je .exit_phys      
    jmp .row_match4

.brick_found4:
    mov ax,7
    push ax
    push bx
    call Draw_Single_Brick_Row
    inc byte [cs:gamer]
    
    mov ax, 10
    call Update_Score
    call AttemptSpawnPowerup  
    
    mov ax, 2000
    mov cx, 0x1000
    call PlaySound

    cmp byte[flag],0
    je .bounce_down4
    cmp byte[flag],1
    je .bounce_up4

.bounce_down4:
    sub byte[cs:ballrow],2
.bounce_down4_force:
    mov byte[flag],1
    mov si,0
    jmp .mark_destroyed4
.bounce_up4:
    inc byte[cs:ballrow]
    mov byte[flag],0
    mov si,0
.mark_destroyed4:
    mov word[bx+si],0xFFFF
    add si,2
    cmp si,48
    jne .mark_destroyed4
    pop bx
    pop ax
    mov si,0
    call Draw_Ball_Only 

.exit_phys:
    popa
    pop bp
    ret 

AttemptSpawnPowerup:
    pusha
    
    cmp byte [cs:item_active], 1
    jne .check_random
    jmp .exit_spawn

.check_random:
    mov ax, [cs:score]
    add al, [cs:ballcol]
    and al, 0x03        
    
    cmp al, 0
    jne .check_life_spawn
    jmp .spawn_double_points

.check_life_spawn:
    cmp al, 2
    jne .exit_spawn
    jmp .spawn_extra_life

.spawn_double_points:
    mov byte [cs:item_active], 1
    mov byte [cs:item_type], 1
    mov dh, [cs:ballrow]
    mov dl, [cs:ballcol]
    mov [cs:item_row], dh
    mov [cs:item_col], dl
    jmp .exit_spawn

.spawn_extra_life:
    mov byte [cs:item_active], 1
    mov byte [cs:item_type], 2
    mov dh, [cs:ballrow]
    mov dl, [cs:ballcol]
    mov [cs:item_row], dh
    mov [cs:item_col], dl

.exit_spawn:
    popa
    ret

Update_Falling_Item:
    pusha
    cmp byte [cs:item_active], 0
    jne .proceed_update    
    jmp .exit_item_update  
.proceed_update:

    push cs
    pop es            
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, 0x07 
    mov cx, 2         
    mov dh, [cs:item_row]
    mov dl, [cs:item_col]
    mov bp, str_empty 
    int 0x10

    inc byte [cs:item_row]
    
    cmp byte [cs:item_row], 24
    jae .item_missed

    cmp byte [cs:item_row], 0x17 
    je .check_cols
    jmp .draw_item

.check_cols:
    mov al, [cs:item_col]
    mov si, 0
    mov bx, Boardposition
.check_paddle_cols:
    mov dx, [bx+si] 
    cmp dl, al      
    jne .next_col_check
    jmp .item_caught
.next_col_check:
    add si, 2
    cmp si, 48
    jne .check_paddle_cols
    jmp .draw_item

.item_caught:
    cmp byte [cs:item_type], 1
    je .apply_2x
    cmp byte [cs:item_type], 2
    je .apply_life
    jmp .reset_item

.apply_2x:
    mov byte [cs:powerup_status], 1
    mov word [cs:powerup_timer], 180
    mov ax, 500
    mov cx, 0x1000
    call PlaySound
    mov ax, 1000
    mov cx, 0x1000
    call PlaySound
    jmp .reset_item

.apply_life:
    cmp byte [cs:gamecounter], 0
    jle .reset_item
    dec byte [cs:gamecounter]
    inc byte [cs:life]
    mov ax, 2500
    mov cx, 0x2000
    call PlaySound
    jmp .reset_item

.item_missed:
.reset_item:
    mov byte [cs:item_active], 0
    jmp .exit_item_update

.draw_item:
    push cs
    pop es       
    mov ah, 0x13 
    mov al, 0 
    mov bh, 0 
    mov bl, 0x0E 
    cmp byte [cs:item_type], 2
    jne .draw_char_2x
    
    mov bl, 0x0C 
    mov cx, 1
    mov bp, item_char_life
    jmp .do_draw

.draw_char_2x:
    mov cx, 2    
    mov bp, item_char_2x

.do_draw:
    mov dh, [cs:item_row]
    mov dl, [cs:item_col]
    int 0x10

.exit_item_update:
    popa
    ret

NextLevel:
    pusha
    
    mov ax, 1000
    mov cx, 0x1000
    call PlaySound
    mov ax, 1500
    mov cx, 0x1000
    call PlaySound
    mov ax, 2000
    mov cx, 0x1000
    call PlaySound

    inc byte [current_level]
    cmp byte [base_speed], 2
    jle .skip_speed_inc
    dec byte [base_speed]     
    
    mov al, [base_speed]
    mov [speed_delay], al
.skip_speed_inc:

    mov byte [gamer], 0        
    mov byte [ballrow], 0x0C
    mov byte [ballcol], 0x28
    mov byte [ballrowspace], 0x0C
    mov byte [ballcolspace], 0x28
    mov byte [flag], 0         
    mov byte [flag1], 0
    
    mov byte [item_active], 0

    push ds
    push es
    mov si, bricks_backup
    mov di, data_region_start
    mov cx, data_region_end - data_region_start
    cld
    rep movsb
    pop es
    pop ds

    call Draw_All_Bricks

    popa
    ret

printscore:
    push bp 
    mov bp, sp 
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 
    mov ax, 0xb800 
    mov es, ax 
    mov ax, [score] 
    mov bx, 10 
    mov cx, 0 
.nextdigit:
    mov dx, 0 
    div bx 
    add dl, 0x30 
    push dx 
    inc cx 
    cmp ax, 0 
    jnz .nextdigit
    mov ah,0x02
    mov al,'S'
    mov word[es:3920],ax
    mov al,'c'
    mov word[es:3922],ax
    mov al,'o'
    mov word[es:3924],ax
    mov al,'r'
    mov word[es:3926],ax
    mov al,'e'
    mov word[es:3928],ax
    mov di, 3932
.nextpos: 
    pop dx 
    mov dh, 0x02 
    mov [es:di], dx 
    add di, 2 
    loop .nextpos 
    pop di 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
    pop es 
    pop bp 
    ret 2 

Update_Score:
    pusha
    
    cmp byte [cs:powerup_status], 1
    jne .add_points
    shl ax, 1 

.add_points:
    add word[cs:score], ax
    
    mov bl,[cs:min]
    cmp bl,0x02
    jg .skip_bonus_logic
    
    cmp byte[gamer],24 
    jne .skip_bonus_logic
    
    add word[cs:score], 100 
    
.skip_bonus_logic:
    push word[cs:score]
    call printscore
    popa
    ret

LoadHighScore:
    pusha
    mov ah, 3Dh
    mov al, 0           
    mov dx, filename
    int 21h
    jc .load_error      
    
    mov [filehandle], ax

    mov ah, 3Fh
    mov bx, [filehandle]
    mov cx, 2
    mov dx, highscore   
    int 21h

    mov ah, 3Eh
    mov bx, [filehandle]
    int 21h
    jmp .load_done

.load_error:
    mov word [highscore], 0 

.load_done:
    popa
    ret

SaveHighScore:
    pusha
    mov ax, [score]
    cmp ax, [highscore]
    jle .skip_save
    
    mov [highscore], ax
    
    mov ah, 3Ch
    mov cx, 0           
    mov dx, filename
    int 21h
    jc .skip_save       
    
    mov [filehandle], ax

    mov ah, 40h
    mov bx, [filehandle]
    mov cx, 2
    mov dx, highscore   
    int 21h

    mov ah, 3Eh
    mov bx, [filehandle]
    int 21h

.skip_save:
    popa
    ret

Endpage:
    pusha
    call SaveHighScore

    mov ah, 06h    
    xor al, al     
    xor cx, cx     
    mov dx, 184fh  
    mov bh, 07h    
    int 10h        

    mov ah, 0x13 
    mov al, 1    
    mov bh, 0    
    mov bl, 0x0F 
    mov cx, 9    
    mov dx, 0x0423 
    push cs
    pop es 
    mov bp, str_game_over
    int 0x10

    cmp byte [cs:gamecounter], 3
    je show_lose_msg

    mov cx, 17
    mov dx, 0x061F 
    mov bp, str_win
    jmp print_result_msg
show_lose_msg:
    mov cx, 12
    mov dx, 0x0622 
    mov bp, str_lose

print_result_msg:
    mov ah, 0x13
    mov al, 1
    mov bh, 0
    mov bl, 0x0C 
    int 0x10

    mov ah, 0x13 
    mov al, 1
    mov bh, 0
    mov bl, 0x07 
    mov cx, 7
    mov dx, 0x081E 
    mov bp, str_score
    int 0x10
    mov ax, [score]
    call print_num_tty

    mov ah, 0x13 
    mov al, 1
    mov bl, 0x07
    mov cx, 6
    mov dx, 0x091E 
    mov bp, str_time
    int 0x10
    
    xor ax, ax
    mov al, [min]
    call print_num_tty
    mov al, ':'
    mov ah, 0x0E
    int 0x10
    xor ax, ax
    mov al, [sec]
    call print_num_tty

    mov ah, 0x13 
    mov al, 1
    mov bl, 0x07
    mov cx, 7
    mov dx, 0x0A1E 
    mov bp, str_lives
    int 0x10
    mov al, 3
    sub al, [gamecounter]
    add al, 0x30 
    mov ah, 0x0E
    int 0x10

    mov ah, 0x13 
    mov al, 1
    mov bl, 0x07
    mov cx, 25
    mov dx, 0x0C1B 
    mov bp, str_play_again
    int 0x10

    mov ah, 0x13 
    mov al, 1
    mov bl, 0x07
    mov cx, 20
    mov dx, 0x0D1E 
    mov bp, str_quit
    int 0x10

wait_for_end_input:
    mov ah, 0
    int 16h
    
    cmp al, 13 
    je restart_game
    cmp al, 27 
    je exit_dos
    jmp wait_for_end_input

restart_game:
    call unhook_interrupts  
    call ResetGameData
    popa
    ret 
exit_dos:
    call unhook_interrupts 
    mov ah, 06h
    xor al, al
    xor cx, cx
    mov dx, 184fh
    mov bh, 07h
    int 10h
    
    popa
    mov ax,0x4c00
    int 0x21

print_num_tty:
    pusha
    cmp ax, 0
    jge .positive
    neg ax
    push ax
    mov al, '-'
    mov ah, 0x0E
    int 0x10
    pop ax
.positive:
    mov cx, 0
    mov bx, 10
.digit_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz .digit_loop
.print_loop:
    pop dx
    add dl, 0x30
    mov al, dl
    mov ah, 0x0E
    int 0x10
    loop .print_loop
    popa
    ret
              
ResetGameData:
    pusha
    
    mov word [score], -10
    mov byte [timercount], 0
    mov byte [min], 0
    mov byte [sec], 0
    mov byte [gamer], 0
    mov byte [gamecounter], 0
    mov byte [ballrow], 0x0C
    mov byte [ballcol], 0x28
    mov byte [ballrowspace], 0x0C
    mov byte [ballcolspace], 0x28
    mov byte [life], '3'
    mov byte [game_over_flag], 0
    mov byte [flag], 0
    mov byte [flag1], 0
    
    mov byte [boxcount], 0
    mov byte [boxcount1], 0
    mov byte [boxcount2], 0
    mov byte [boxcount3], 0 
    mov byte [counter], 0
    
    mov byte [current_level], 1
    mov byte [speed_delay], 4
    mov byte [base_speed], 4
    mov byte [item_active], 0
    
    push ds
    push es
    mov si, bricks_backup
    mov di, data_region_start
    mov cx, data_region_end - data_region_start
    cld
    rep movsb
    pop es
    pop ds
    
    popa
    ret

delay:
    dec bx
    cmp bx,0
    jne delay
    ret

start:
    xor ax,ax
    mov es,ax
    
    mov ax,[es:9*4]
    mov [oldisr],ax
    mov ax,[es:9*4+2]
    mov [oldisr+2],ax
    
    mov ax,[es:8*4]
    mov [oldtimer], ax
    mov ax,[es:8*4+2]
    mov [oldtimer+2], ax
    
    cli
    mov word [es:8*4],Timer_ISR_GameLoop
    mov [es:8*4+2],cs
    mov word [es:9*4],Keyboard_ISR
    mov [es:9*4+2],cs
    sti
enter2:
    cmp byte [cs:game_over_flag], 1
    je do_game_over_screen
    
    mov ah, 1
    int 16h
    jz enter2 
    
    mov ah, 0
    int 16h
    cmp al, 27 
    jne enter2
    
    call unhook_interrupts 
    mov ax,4c00h
    int 21h

do_game_over_screen:
    call Endpage
    jmp Main_Entry_Point

unhook_interrupts:
    push es
    push ax
    xor ax, ax
    mov es, ax
    cli
    mov ax, [cs:oldisr]
    mov [es:9*4], ax
    mov ax, [cs:oldisr+2]
    mov [es:9*4+2], ax
    mov ax, [cs:oldtimer]
    mov [es:8*4], ax
    mov ax, [cs:oldtimer+2]
    mov [es:8*4+2], ax
    sti
    pop ax
    pop es
    ret

bricks_backup: times 2500 db 0
