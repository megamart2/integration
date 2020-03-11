#
# ASPECT-ORIENTED C (ACC) - an aspect-oriented extension for the C language
#
# Copyright (C) 2006 . All rights reserved.
#
# Weigang (Michael) Gong, Hans-Arno-Jacobsen
#
# ACC development team (www.aspectc.net),
# Middleware Systems Research Group (www.msrg.utoronto.ca),
# University of Toronto.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
#set up enviroment variables
CC=gcc
CCFLAG=-g -DYYDEBUG -DUT_AC_DEBUG #compile options
CCFLAGOPT= 
TACC=../bin/tacc -acc-option="-n" -bootstrappath=.. 
ACC_TARGET=../bin/acc
LIB_TARGET=../lib/libacc.a
AR=ar

SRC=Parse.c Decls.c Unparse.c Bodies.c AST.c IR.c DefTab.c Types.c Scanning.c Error.c Coder.c Mapping.c Arith.c weaveutil.c Weave.c Semantic.c main.c  lexer.c output.c XARITH.c xerror.c XCODER.c pointcut.c symboltable.c y.tab.c grts.c

ASPECT=matchinfo.acc matchaa.acc

ACCLIB_SRC=libacc.c

ACCLIB_O=libacc.o

#build acc without aspect
all: $(SRC) lib
	$(CC) $(CCFLAGOPT) -o $(ACC_TARGET) $(SRC)

debug: $(SRC) lib
	$(CC) $(CCFLAG) -o $(ACC_TARGET) $(SRC)

#bootstrapping acc
all_bs: all lib $(ASPECT)
	$(TACC) $(CCFLAGOPT) -o $(ACC_TARGET) $(SRC) $(ASPECT)

debug_bs: all lib $(ASPECT)
	$(TACC) $(CCFLAG) -o $(ACC_TARGET) $(SRC) $(ASPECT)

#build ACC library
lib:$(ACCLIB_SRC)
	$(CC) -c $(ACCLIB_SRC)
	$(AR) rvs $(LIB_TARGET) $(ACCLIB_O)

clean:
	rm -rf $(ACC_TARGET) $(LIB_TARGET) *.o 
