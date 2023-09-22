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
	@rm -rf $(WP_DIR)
	@rm -rf $(MARIADB_DIR)

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

.PHONY: all up down

#COLORS
GREEN = \033[1;32m
RED = \033[1;31m
DEFAULT = \033[0m
YELLOW = \033[1;33m