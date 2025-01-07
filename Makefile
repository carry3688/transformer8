run:
	sudo python3 network.py

clean: 
	sudo rm -rf pcap/*
	sudo rm -rf log/*
	sudo rm -f p4src/*.p4i
	sudo rm -f p4src/*.json
	sudo rmdir pcap
	sudo rmdir log
	sudo rm -rf *.json

all: run
