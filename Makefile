# 
# Written by Louis LeBlanc
# For Homework Assignment 5
# Release Control and Continuous Integration/Continuous Delivery
# Brandeis University,
# Instructed by Eric Hemdal
# 
# Basic makefile for random number generator.


TARGET = myrand
LIBS = -lm
CC = gcc
SRCDIR = src
OBJDIR = obj
CFLAGS = -g -Wall

SOURCE = $(SRCDIR)/$(TARGET).c
OBJECT = $(OBJDIR)/$(TARGET).o

.PHONY: all default clean

default: $(TARGET)

all: default

clean:
	rm -f $(OBJECT)
	rm -f $(TARGET)
	rmdir $(OBJDIR)

$(OBJECT): $(SOURCE) $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

$(TARGET): $(OBJECT)
	$(CC) $(OBJECT) -Wall $(LIBS) -o $(TARGET)

