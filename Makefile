#https://medium.com/freestoneinfotech/simplifying-docker-compose-operations-using-makefile-26d451456d63

# The shell function
#https://www.gnu.org/software/make/manual/html_node/Shell-Function.html

#################### VARIABLES ####################

OS	:= $(shell uname -s)
ifeq ($(OS), Darwin)
	DKC		= docker-compose -f
else
	DKC		= docker compose -f
endif

NAME	= inception
RM		= rm -rf
MK		= mkdir -p
DKFILE	= srcs/docker-compose.yml

# #################### RULES ####################

all: $(NAME)

$(NAME) :
		@$(MK) ~/data/web_data ~/data/db_data
		@echo "hola" $(ENV)
		@echo "Building Images ..."
		$(DKC) $(DKFILE) build
		@echo "Up containers"
		$(DKC) $(DKFILE) up -d
debug:
	$(DKC) $(DKFILE) up

down:
	$(DKC) $(DKFILE) down

clean: 
	$(DKC) $(DKFILE) down --rmi all

vclean:
	@docker volume prune

fclean: clean vclean

prune:
	@docker system prune

re:	fclean all

.PHONY: clean fclean up down re all
