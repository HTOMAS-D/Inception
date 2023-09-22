WP_DIR = ./srcs/requirements/wordpress/data
MARIADB_DIR = ./srcs/requirements/mariadb/data


all: up

$(WP_DIR):
	@mkdir -p $@

$(MARIADB_DIR):
	@mkdir -p $@

up: $(MARIADB_DIR) $(WP_DIR)
	@echo "$(GREEN)Docker compose UP ongoing 🏗️$(DEFAULT)"
	@docker compose -f srcs/docker-compose.yml up --build -d

down: 
	@echo "$(RED)Docker compose DOWN ongoing 💥$(DEFAULT)"
	@docker compose -f srcs/docker-compose.yml down
	@rm -rf requirements/mariadb/data/
	@rm -rf requirements/wordpress/data/

re: down up

deep_clean:
	@docker stop $$(docker ps -qa)
	@docker system prune -a
	@rm -rf $(MARIADB_DIR)
	@rm -rf $(WP_DIR)


god:
	git status
	git add .
	git status
	git commit -m "🔥Random Makefile Commit🔥"
	git status
	git push

purge: deep_clean
	@clear
	@-if [ $$(docker ps -q | wc -l) -gt 0 ]; then \
		docker stop $$(docker ps -q); \
		echo " All containers $(YELLOW)stopped!"; \
	fi
	-@docker system prune --all --force
	@-if [ $$(docker ps -a -q | wc -l) -gt 0 ]; then \
		docker rm $$(docker ps -a -q); \
	fi
	@echo " All containers $(YELLOW)removed!"
	@-if [ $$(docker images -q | wc -l) -gt 0 ]; then \
		docker rmi $$(docker images -q); \
	fi
	@echo " All images $(YELLOW)removed!"
	@docker volume prune --force
	@echo " All volumes $(YELLOW)removed!"
	@docker network prune --force
	@echo " All networks $(YELLOW)removed!"
	@docker builder prune --force
	@echo " All builders $(YELLOW)removed!"

.PHONY: all up down

#COLORS
GREEN = \033[1;32m
RED = \033[1;31m
DEFAULT = \033[0m
YELLOW = \033[1;33m