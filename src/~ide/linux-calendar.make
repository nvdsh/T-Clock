#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC = $(CCACHE) i686-w64-mingw32-gcc
CXX = $(CCACHE) i686-w64-mingw32-g++
AR = i686-w64-mingw32-ar
LD = i686-w64-mingw32-g++
WINDRES = i686-w64-mingw32-windres

INC = 
CFLAGS = -D_UNICODE -DUNICODE -fno-ident -Wall -Werror=declaration-after-statement -fvisibility=hidden -ffunction-sections -fno-asynchronous-unwind-tables -D_POSIX=1 -D_POSIX_C_SOURCE=200112L -D__STDC_FORMAT_MACROS -D__USE_MINGW_ANSI_STDIO=0 -D__MINGW_USE_VC2005_COMPAT -DWINVER=0x0501 -DPSAPI_VERSION=1 -DWIN2K_COMPAT
RESINC = 
LIBDIR = 
LIB = -ladvapi32 -lshell32 -luser32 -lgdi32 -lpsapi -lcomdlg32 -lcomctl32 -lmsimg32
LDFLAGS = -static -Wl,--gc-sections

INC_RELEASE = $(INC)
CFLAGS_RELEASE = $(CFLAGS) -O3 -m32 -DNDEBUG
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(LIB)
LDFLAGS_RELEASE = $(LDFLAGS) -s -m32
OBJDIR_RELEASE = ../.obj/gcc
DEP_RELEASE = 
OUT_RELEASE = ../../Release/misc/XPCalendar.exe

INC_DEBUG = $(INC)
CFLAGS_DEBUG = $(CFLAGS) -m32 -g -fno-omit-frame-pointer -D_DEBUG
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS)
LIBDIR_DEBUG = $(LIBDIR)
LIB_DEBUG = $(LIB)
LDFLAGS_DEBUG = $(LDFLAGS) -m32
OBJDIR_DEBUG = ../.obj/gcc/dbg
DEP_DEBUG = 
OUT_DEBUG = ../../Debug/misc/XPCalendar.exe

OBJ_RELEASE = $(OBJDIR_RELEASE)/__/common/win2k_compat.o \
	$(OBJDIR_RELEASE)/__/common/utl.o \
	$(OBJDIR_RELEASE)/__/common/newapi.o \
	$(OBJDIR_RELEASE)/__/common/control_extensions.o \
	$(OBJDIR_RELEASE)/__/common/clock.o \
	$(OBJDIR_RELEASE)/__/Calendar/resource.o \
	$(OBJDIR_RELEASE)/__/Calendar/DeskCalendar.o

OBJ_DEBUG = $(OBJDIR_DEBUG)/__/common/win2k_compat.o \
	$(OBJDIR_DEBUG)/__/common/utl.o \
	$(OBJDIR_DEBUG)/__/common/newapi.o \
	$(OBJDIR_DEBUG)/__/common/control_extensions.o \
	$(OBJDIR_DEBUG)/__/common/clock.o \
	$(OBJDIR_DEBUG)/__/Calendar/resource.o \
	$(OBJDIR_DEBUG)/__/Calendar/DeskCalendar.o

all: before_build build_release build_debug after_build

clean: clean_release clean_debug

before_build: 
	../common/AutoVersion --git . ../common/version.h

after_build: 

before_release: 
	test -d ../../Release/misc || mkdir -p ../../Release/misc
	test -d $(OBJDIR_RELEASE)/__/common || mkdir -p $(OBJDIR_RELEASE)/__/common
	test -d $(OBJDIR_RELEASE)/__/Calendar || mkdir -p $(OBJDIR_RELEASE)/__/Calendar

after_release: 

build_release: before_release out_release after_release

release: before_build build_release after_build

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) -mwindows $(LIB_RELEASE)

$(OBJDIR_RELEASE)/__/common/win2k_compat.o: ../common/win2k_compat.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/win2k_compat.c -o $(OBJDIR_RELEASE)/__/common/win2k_compat.o

$(OBJDIR_RELEASE)/__/common/utl.o: ../common/utl.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/utl.c -o $(OBJDIR_RELEASE)/__/common/utl.o

$(OBJDIR_RELEASE)/__/common/newapi.o: ../common/newapi.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/newapi.c -o $(OBJDIR_RELEASE)/__/common/newapi.o

$(OBJDIR_RELEASE)/__/common/control_extensions.o: ../common/control_extensions.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/control_extensions.c -o $(OBJDIR_RELEASE)/__/common/control_extensions.o

$(OBJDIR_RELEASE)/__/common/clock.o: ../common/clock.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/clock.c -o $(OBJDIR_RELEASE)/__/common/clock.o

$(OBJDIR_RELEASE)/__/Calendar/resource.o: ../Calendar/resource.rc
	$(WINDRES) -i ../Calendar/resource.rc -J rc -o $(OBJDIR_RELEASE)/__/Calendar/resource.o -O coff $(INC_RELEASE)

$(OBJDIR_RELEASE)/__/Calendar/DeskCalendar.o: ../Calendar/DeskCalendar.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../Calendar/DeskCalendar.c -o $(OBJDIR_RELEASE)/__/Calendar/DeskCalendar.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf $(OBJDIR_RELEASE)/__/common
	rm -rf $(OBJDIR_RELEASE)/__/Calendar

before_debug: 
	test -d ../../Debug/misc || mkdir -p ../../Debug/misc
	test -d $(OBJDIR_DEBUG)/__/common || mkdir -p $(OBJDIR_DEBUG)/__/common
	test -d $(OBJDIR_DEBUG)/__/Calendar || mkdir -p $(OBJDIR_DEBUG)/__/Calendar

after_debug: 
	objcopy --only-keep-debug ../../Debug/misc/XPCalendar.exe ../../Debug/misc/XPCalendar.dbg
	objcopy --strip-debug --strip-unneeded --add-gnu-debuglink=../../Debug/misc/XPCalendar.dbg ../../Debug/misc/XPCalendar.exe

build_debug: before_debug out_debug after_debug

debug: before_build build_debug after_build

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_DEBUG)  $(LDFLAGS_DEBUG) -mwindows $(LIB_DEBUG)

$(OBJDIR_DEBUG)/__/common/win2k_compat.o: ../common/win2k_compat.c
	$(CC) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/win2k_compat.c -o $(OBJDIR_DEBUG)/__/common/win2k_compat.o

$(OBJDIR_DEBUG)/__/common/utl.o: ../common/utl.c
	$(CC) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/utl.c -o $(OBJDIR_DEBUG)/__/common/utl.o

$(OBJDIR_DEBUG)/__/common/newapi.o: ../common/newapi.c
	$(CC) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/newapi.c -o $(OBJDIR_DEBUG)/__/common/newapi.o

$(OBJDIR_DEBUG)/__/common/control_extensions.o: ../common/control_extensions.c
	$(CC) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/control_extensions.c -o $(OBJDIR_DEBUG)/__/common/control_extensions.o

$(OBJDIR_DEBUG)/__/common/clock.o: ../common/clock.c
	$(CC) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/clock.c -o $(OBJDIR_DEBUG)/__/common/clock.o

$(OBJDIR_DEBUG)/__/Calendar/resource.o: ../Calendar/resource.rc
	$(WINDRES) -i ../Calendar/resource.rc -J rc -o $(OBJDIR_DEBUG)/__/Calendar/resource.o -O coff $(INC_DEBUG)

$(OBJDIR_DEBUG)/__/Calendar/DeskCalendar.o: ../Calendar/DeskCalendar.c
	$(CC) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../Calendar/DeskCalendar.c -o $(OBJDIR_DEBUG)/__/Calendar/DeskCalendar.o

clean_debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf $(OBJDIR_DEBUG)/__/common
	rm -rf $(OBJDIR_DEBUG)/__/Calendar

.PHONY: before_build after_build before_release after_release clean_release before_debug after_debug clean_debug

