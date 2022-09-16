PRJ_HOME = $(shell pwd)
DIR_OBJ := $(PRJ_HOME)/obj
SRC_DIR := $(PRJ_HOME)/src
INCLUDE=$(PRJ_HOME)/incl
DIR_BIN = $(PRJ_HOME)/bin
SRCS :=  $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(addprefix $(DIR_OBJ)/, $(patsubst %.cpp, %.o,$(notdir $(SRCS))))
LIBS := m
CXXFLAG=-Wall -g -O0
TARGET = app
$(DIR_BIN)/$(TARGET): $(OBJS)  $(DIR_OBJ)/main.o
	$(CXX) $(CXXFLAG) -o $@ $(OBJS) $(DIR_OBJ)/main.o

$(DIR_OBJ)/main.o: $(PRJ_HOME)/main.cpp
	$(CXX) $(CXXFLAG) -c main.cpp -o $@ -I $(INCLUDE) -L$(LIBS)
$(DIR_OBJ)/%.o: $(SRCS)
	$(CXX) $(CXXFLAG) -c $^ -o $@ -I $(INCLUDE) -L$(LIBS)

.PYTHON: cleanall clean cleantxt print run
cleanall: clean cleantxt
clean:
	@-rm -v -f $(OBJS) $(BIN_DIR)/text
cleantxt:
	@rm -f *.txt
run:
	@make
	@echo "开始运行程序"
	@./bin/app
print:
	@echo $(PRJ_HOME)
	@echo $(SRCS)
	@echo $(INCLUDE)
    @echo $(notdir $(SRCS))root@liuhuo:/mnt/f/linux/code/likou#