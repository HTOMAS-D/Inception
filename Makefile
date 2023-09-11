all: up
	
up:
	@echo "$(GREEN)docker compose up ongoing$(DEFAULT)"
	@docker-compose -f srcs/docker-compose.yml up --build -d

down: 
	@echo"$(RED)docker compose down ongoing$(DEFAULT)"
	@docker-compose -f srcs/docker-compose.yml down

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