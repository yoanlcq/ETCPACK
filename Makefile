ifeq ($(OS),Windows_NT)
EXE_EXTENSION:=.exe
else
EXE_EXTENSION:=
endif

EXE:=bin/etcpack$(EXE_EXTENSION)

.PHONY: all clean re
all: $(EXE)

CXXFILES:=$(wildcard source/*.cxx)
OFILES:=$(CXXFILES:source/%.cxx=obj/%.o)
WARNING_CXXFLAGS:=-Wall -Wextra -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-type-limits -Wno-unknown-pragmas -Wno-parentheses -Wno-maybe-uninitialized -Wno-strict-overflow -Wno-unused-result
CXXFLAGS:=$(WARNING_CXXFLAGS) -O3

$(EXE): $(OFILES)
	@mkdir -p $(@D)
	g++ $(CXXFLAGS) $^ -o $@

obj/%.o: source/%.cxx
	@mkdir -p $(@D)
	g++ $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf obj/*

re: clean all
