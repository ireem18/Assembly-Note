data segment
   satir db -1
   sutun db 0
   sayac db 1
   tmp db 1
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

    mov cx,5
    dongu:
        inc satir
        mov sutun,0
        call imlec
        for:
            call yaz
            dec sayac
            jnz for
            inc tmp
            mov al,tmp
            mov sayac,al
            
     loop dongu
     
     
     imlec proc
        mov ah,02h
        mov bl,00h
        mov dl,sutun
        mov dh,satir
        int 10h
        ret
        imlec endp
     
     yaz proc
        mov dl,"*"
        mov ah,02h
        int 21h
        ret
        yaz endp
          
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
