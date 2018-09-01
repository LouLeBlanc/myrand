# 
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
CFLAGS = -g -Wall

SOURCE = $(SRCDIR)/$(BIN).c
HEADER = $(INCDIR)/$(BIN).h
OBJECT = $(OBJDIR)/$(BIN).o
TARGET = $(BINDIR)/$(BIN)

.PHONY: all default clean install srcarchive

default: $(TARGET)

all: default

clean:
	@rm -rf $(OBJDIR)
	@rm -rf $(BINDIR)
	@rm -f *.new
	@rm -f *.tgz

$(OBJECT): $(SOURCE) $(HEADER) $(OBJDIR)
	@$(CC) $(CFLAGS) -c $(SOURCE) -I$(INCDIR) -o $@

$(OBJDIR):
	@mkdir $(OBJDIR)

$(BINDIR):
	@mkdir $(BINDIR)

$(TARGET): $(OBJECT) $(BINDIR)
	@$(CC) $(OBJECT) -Wall $(LIBS) -o $@

install: $(TARGET)
	@mkdir -p $(DESTDIR)/usr/bin
	install -m 0755 $(BIN) $(DESTDIR)/usr/bin/$(BIN)

srcarchive:
	@tar zcf myrand_source.tgz src include README.md Makefile


