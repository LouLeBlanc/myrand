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

.PHONY: all default clean

default: $(TARGET)

all: default

clean:
	rm -f $(OBJECT)
	rm -f $(TARGET)
	rm -f %.new
	rmdir $(OBJDIR)
	rmdir $(BINDIR)

$(OBJECT): $(SOURCE) $(HEADER) $(OBJDIR)
	$(CC) $(CFLAGS) -c $(SOURCE) -I$(INCDIR) -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(TARGET): $(OBJECT) $(BINDIR)
	$(CC) $(OBJECT) -Wall $(LIBS) -o $@

