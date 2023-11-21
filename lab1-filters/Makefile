# Makefile for module compilation and simulation -- ModelSim

# Recipe 
all: basic adv 
	echo "IIR filter basic and advanced"

basic:
	cd ./basic; \
	echo "BASIC"; \
	./run.sh; \
	echo "Done"; \    
	cd ..; \

adv:
	echo "ADVANCED"; \
	cd adv; \
	./run.sh; \
	echo "Done"; \
	cd ..; \

clean:
	echo "CLEAN all temp files"; \
	./clean.sh;

.PHONY: all basic adv

