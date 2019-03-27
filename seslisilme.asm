; multi-segment executable file template.

data segment
    
    pkey db "press any key...$" 
    sutun db 0
    satir db 0
    metin db " $"  
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov es, ax
    lea si,metin 
                                                            
    while:
    mov ah,01
    int 21h    
    cmp al,0dh 
    je bitir 
    mov [si],al
    inc si  
    jmp while
      
    
    
    bitir:               
    mov [si],'$' 
    
    lea si,metin
   
    while2:
    mov al,[si]
    cmp al,105
    je bosluk
    cmp al,101
    je bosluk 
    cmp al,97
    je bosluk
    cmp al,111 
    je bosluk
    cmp al,117
    je bosluk
    cmp al,49
    je bosluk
    cmp al,41
    je bosluk
    cmp al,45
    je bosluk
    cmp al,04fh
    je bosluk
    cmp al,55
    je bosluk
    
    cmp al,'$'
    je go
    mov bl,07h
    mov cx,1
    mov ah,09h
    int 10h 
    inc si 
    call arttir
    jmp while2
    
    
    
    bosluk:      
    mov al,32   ;Space karakteri
    mov bl,07h
    mov cx,1
    mov ah,09h
    int 10h      
    inc si 
    call arttir
    jmp while2
    
    arttir proc
        inc sutun 
        mov dl,sutun
        mov dh,satir
        mov bl,00h
        mov ah,02h
        int 10h
        
    ret    
    arttir endp     
    
   
    
    go:
            
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
