##
## Makefile for minilibc in
## 
## Made by Maxime Pillon
## Login   <maxime.pillon@epitech.net>
## 
## Started on  Fri Mar 10 14:24:01 2017 Pillon Maxime
## Last update Mon Mar 20 17:15:02 2017 Maxence DELACROIX
##

LIBNAME	=	libasm.so

SRC	=	src/strlen.s \
		src/strcmp.s \
		src/strncmp.s \
		src/strchr.s \
		src/memcpy.s \
		src/memmove.s \
		src/memset.s \
		src/rindex.s \
		src/strpbrk.s \
		src/strcspn.s \
		src/strstr.s \
		src/strcasecmp.s

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
