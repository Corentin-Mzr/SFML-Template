CXX := g++
CFLAGS := -Wall -Wextra -std=c++20 -Iexternals/SFML/include
LDFLAGS := -Lexternals/SFML/lib
LDLIBS := -lsfml-graphics -lsfml-window -lsfml-system
DEBUG_FLAGS := -g -DDEBUG
RELEASE_FLAGS := -O2

SRCDIR := src
BINDIR := bin
BINDIR_DEBUG := $(BINDIR)/debug
BINDIR_RELEASE := $(BINDIR)/release
OBJDIR_DEBUG := $(BINDIR_DEBUG)/obj
OBJDIR_RELEASE := $(BINDIR_RELEASE)/obj

SRCFILES := $(wildcard $(SRCDIR)/*.cpp $(SRCDIR)/**/*.cpp)
OBJFILES_DEBUG := $(patsubst %.cpp,$(OBJDIR_DEBUG)/%.o,$(notdir $(SRCFILES)))
OBJFILES_RELEASE := $(patsubst %.cpp,$(OBJDIR_RELEASE)/%.o,$(notdir $(SRCFILES)))

EXECUTABLE_NAME := SFML_Template.exe
EXECUTABLE_DEBUG := $(BINDIR_DEBUG)/$(EXECUTABLE_NAME)
EXECUTABLE_RELEASE := $(BINDIR_RELEASE)/$(EXECUTABLE_NAME)

.PHONY: all debug release clean test

all: debug release

test:
	@echo src files: $(SRCFILES)
	@echo obj dir debug: $(OBJDIR_DEBUG)
	@echo obj files debug: $(OBJFILES_DEBUG)
	@echo obj dir release: $(OBJDIR_RELEASE)
	@echo obj files release: $(OBJFILES_RELEASE)

debug: $(EXECUTABLE_DEBUG)

release: $(EXECUTABLE_RELEASE)

$(EXECUTABLE_DEBUG): $(OBJFILES_DEBUG) 
	$(CXX) $(OBJFILES_DEBUG) -o $@ $(LDFLAGS) $(LDLIBS)

$(EXECUTABLE_RELEASE): $(OBJFILES_RELEASE)
	$(CXX) $(OBJFILES_RELEASE) -o $@ $(LDFLAGS) $(LDLIBS) -mwindows

$(OBJDIR_DEBUG)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CFLAGS) $(DEBUG_FLAGS) -c $< -o $@

$(OBJDIR_DEBUG)/%.o: $(SRCDIR)/**/%.cpp
	$(CXX) $(CFLAGS) $(DEBUG_FLAGS) -c $< -o $@

$(OBJDIR_RELEASE)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CFLAGS) $(RELEASE_FLAGS) -c $< -o $@

$(OBJDIR_RELEASE)/%.o: $(SRCDIR)/**/%.cpp
	$(CXX) $(CFLAGS) $(RELEASE_FLAGS) -c $< -o $@

clean:
	del /Q "$(OBJDIR_DEBUG)/"
	del /Q "$(OBJDIR_RELEASE)/"
