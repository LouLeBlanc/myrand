# Written by Louis LeBlanc
# For Homework Assignment 5
# Release Control and Continuous Integration/Continuous Delivery
# Brandeis University,
# Instructed by Eric Hemdal
# 
# Basic makefile for random number generator.


BIN = myrand
LIBS = -lm
CC = gcc
SRCDIR = src
INCDIR = include
OBJDIR = obj
BINDIR = bin
DESTDIR := 
CFLAGS = -g -Wall

SOURCE = $(SRCDIR)/$(BIN).c
HEADER = $(INCDIR)/$(BIN).h
OBJECT = $(OBJDIR)/$(BIN).o
TARGET = $(BINDIR)/$(BIN)
ARCHIVE = myrand.tar.gz
RPM_ROOT := ~/rpmbuild

.PHONY: all default clean install srcarchive rpmbuild

default: $(BIN)

all: default

clean:
	@rm -rf $(OBJDIR)
	@rm -rf $(BINDIR)
	@rm -f *.gz
	@rm -rf RPMS

$(OBJECT): $(SOURCE) $(HEADER) $(OBJDIR)
	@$(CC) $(CFLAGS) -c $(SOURCE) -I$(INCDIR) -o $@

$(OBJDIR):
	@mkdir $(OBJDIR)

$(BINDIR):
	@mkdir $(BINDIR)

$(TARGET): $(OBJECT) $(BINDIR)
	@$(CC) $(OBJECT) -Wall $(LIBS) -o $@

$(BIN): $(TARGET)

install: $(TARGET)
	@mkdir -p $(DESTDIR)/usr/bin
	@mkdir -p $(DESTDIR)/usr/share/doc/myrand
	@install -m 0755 $(TARGET) $(DESTDIR)/usr/bin/$(BIN)
	@install -m 0644 README.md $(DESTDIR)/usr/share/doc/myrand/README.md

srcarchive:
	@tar zcf $(ARCHIVE) src include README.md Makefile

rpmbuild: srcarchive
	@rpmdev-setuptree
	@cp $(ARCHIVE) $(RPM_ROOT)/SOURCES/.
	@cp myrand.spec $(RPM_ROOT)/SPECS/.
	@rpmbuild --quiet -bb $(RPM_ROOT)/SPECS/myrand.spec
	@cp -r $(RPM_ROOT)/RPMS .
	@echo "RPM build complete"
	@tree RPMS

