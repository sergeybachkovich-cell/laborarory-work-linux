CC = $(CROSS_COMPILE)gcc
AR = $(CROSS_COMPILE)ar

INST_DIR = /home/serge/test_for_make/

EXEC = testfile.out
STATIC_LIB = teststatic.a
DYNAMIC_LIB = testdynamic.so

OBJS = main.o list.o matrix.o

PIC_FLAGS = -fPIC
# ARCH используется для передачи макроса в C-код
CFLAGS = -c -DARCH_$(ARCH)

all: $(EXEC) $(STATIC_LIB) $(DYNAMIC_LIB)

install: $(EXEC)
	@echo "Установка $(EXEC) в $(INST_DIR)"
	mkdir -p $(INST_DIR)
	cp $< $(INST_DIR)

#! изменено serge
debug: CFLAGS += -g -O0
debug: $(EXEC)
#! изменено serge

clean:
	@echo "Очистка..."
	rm -f $(EXEC) $(STATIC_LIB) $(DYNAMIC_LIB) $(OBJS)

$(EXEC): $(OBJS)
	$(CC) $^ -o $@ -lm

$(STATIC_LIB): list.o matrix.o
	$(AR) rcs $@ $^

$(DYNAMIC_LIB): list.c matrix.c
	$(CC) $(PIC_FLAGS) -shared $^ -o $@ -lm

main.o: main.c list.h matrix.h
	$(CC) $(CFLAGS) $< -o $@
list.o: list.c list.h
	$(CC) $(CFLAGS) $< -o $@
matrix.o: matrix.c matrix.h
	$(CC) $(CFLAGS) $< -o $@
