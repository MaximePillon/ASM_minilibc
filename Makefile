##
## Makefile for minilibc in /home/baldas/Prog/repos/tek2/asm/funcs
## 
## Made by Hugo Baldassin
## Login   <baldas@epitech.net>
## 
## Started on  Fri Mar 10 14:24:01 2017 Hugo Baldassin
## Last update Sun Mar 19 21:28:20 2017 Pillon maxime
##

LIBNAME	=	libasm.so

SRC	=	src/strlen.s \
		src/strcmp.s \
		src/strncmp.s

OBJ	=	$(SRC:.s=.o)

NASM	=	nasm -f elf64

LD	=	ld -m elf_x86_64


all	:	$(LIBNAME)

$(LIBNAME):	$(OBJ)
		$(LD) $(OBJ) -shared -o $(LIBNAME)
clean	:
		rm -rf $(OBJ)
fclean	:	clean
		rm -rf $(LIBNAME)

re	:	fclean all

.s.o	:
		$(NASM) $< -o $@
