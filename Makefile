EXE:=bin/etcpack.exe

.PHONY: all
all: $(EXE)

CXXFILES:=$(wildcard source/*.cxx)
OFILES:=$(CXXFILES:source/%.cxx=obj/%.o)
CXXFLAGS=-O3

$(EXE): $(OFILES)
	@mkdir -p $(@D)
	g++ $(CXXFLAGS) $^ -o $@

obj/%.o: source/%.cxx
	@mkdir -p $(@D)
	g++ $(CXXFLAGS) -c $< -o $@