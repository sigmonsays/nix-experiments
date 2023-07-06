##
all:
	# deploy        install and rebuild nixos
	# rebuild       rebuild nixos system
	# pull          git pull
	# install       copy nixos files to /etc/nixos
	# gc            nixos garbage collect
	# home          deploy home-manager

.PHONY: home
home:
	$(MAKE) -C home

deploy: N=default
deploy: install rebuild

rebuild:
	sudo nixos-rebuild switch

install: N=default
install:
	sudo ./install.sh $(N)

pull:
	git pull

gc:
	nix-env --delete-generations 14d

# end
