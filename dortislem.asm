data segment
    sayi1 db 'Sayi1:$'
    sayi2 db 'Sayi2:$'
    toplam db 'Toplam=$'
    fark db 'Fark=$'
    bolum db 'Bolum=$'
    carpim db 'Carpim=$' 
    say1 db ?
    say2 db ?
    top db ?
    frk db ?
    bol db ?
    carp db ?
    sutun db ?
    satir db ?
    
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea dx,sayi1
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    mov sayi1,al
    
    inc satir
    mov dl,sutun
    mov dh,satir 
    mov bl,00h
    mov ah,02h
    int 10h
    
    lea dx,sayi2
    mov ah,09h
    int 21h
            
    mov ah,01h
    int 21h
    mov sayi2,al
    
    
    sub sayi1,30h
    sub sayi2,30h
    
    inc satir
    mov dl,sutun
    mov dh,satir 
    mov bl,00h
    mov ah,02h
    int 10h
    
    
    ;;;;;Topmala;;;;;;
    lea dx,toplam
    mov ah,09h
    int 21h 
    
    mov ax,00h
    mov al,sayi1
    add al,sayi2
    mov top,al
      
      mov al,top
      mov bl,10
      div bl
      add al,30h
      add ah,30h
      mov dl,al
      mov dh,ah
      
      mov ah,02h
      int 21h
      
      mov dl,dh    ;adresleme islemlerinde dl kullanilir
      mov ah,02h
      int 21h
         
     ;;;;;;Cikartma;;;;;;
     
    inc satir
    mov dl,sutun
    mov dh,satir 
    mov bl,00h
    mov ah,02h
    int 10h
     
     lea dx,fark
     mov ah,09h
     int 21h
     
     mov ax,00h
     mov al,sayi1
     cmp al,sayi2
     jb negatif
     
     sub al,sayi2
     add al,30h
     mov frk,al
     mov dl,al
     mov ah,02h
     int 21h
     jmp neg2
     
     negatif:
        mov al,240
        mov dl,al
        mov ah,02h
        int 21h 
        mov al,sayi2
        sub al,sayi1                 
        add al,30h
        mov frk,al
        mov dl,al
        mov ah,02h
        int 21h
                 
     neg2:       
      

     ;;;;;;Carpma;;;;;; 
     
     
     inc satir
     mov dl,sutun
     mov dh,satir 
     mov bl,00h
     mov ah,02h
     int 10h
     
     lea dx,carpim
     mov ah,09h
     int 21h
     
     mov ax,00h
     mov al,sayi1
     mul sayi2
     mov carp,al
     
     mov ax,00h
     mov al,carp
     mov bl,10
     div bl
     
     add al,30h
     add ah,30h
     
     mov dh,ah
     mov dl,al
     
     mov ah,02h
     int 21h
     
     mov dl,dh
     mov ah,02h
     int 21h
       
     ;;;;;;Bolme;;;;;;  
     
     inc satir
     mov dl,sutun
     mov dh,satir 
     mov bl,00h
     mov ah,02h
     int 10h
     
     lea dx,bolum
     mov ah,09h
     int 21h
     
     mov ax,00h
     mov al,sayi1
     cmp al,sayi2
     jb git
     
     div sayi2
     add al,30h
     mov dl,al 
     
     mov ah,02h
     int 21h
     jmp devam
     
        git:
             mov al,30h
             mov dl,al
             mov ah,02h
             int 21h
     
    
        devam:
    
    
    
    
    
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
