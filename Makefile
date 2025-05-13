NAME = poke3D

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3

MLX_LINUX = ./libs/mlx_linux/
MLX_MAC = ./libs/mlx_mac/
INCLUDES = ./headers/
OBJDIR = bin

SRCS = srcs/settings.c
SRCS_MAIN = srcs/main.c
ALL_SRCS = $(SRCS) $(SRCS_MAIN)

# Replace .c with .o in the bin/ directory
OBJS = $(ALL_SRCS:%.c=$(OBJDIR)/%.o)

OS_NAME = $(shell uname -s)
CINCLUDES = -I $(INCLUDES)

MLX_OS =
ifeq ($(OS_NAME), Linux)
	MLX_IS = $(MLX_LINUX)
	CINCLUDES += -I $(MLX_LINUX)
	MLX_OS += -L $(MLX_LINUX) -lmlx -lXext -lX11 -lm
endif
ifeq ($(OS_NAME), Darwin)
	MLX_IS = $(MLX_MAC)
	CINCLUDES += -I $(MLX_MAC)
	MLX_OS += -L $(MLX_MAC) -lmlx -framework OpenGL -framework Appkit -lm
endif

all: $(NAME)

$(NAME): $(OBJS) $(MLX_IS)libmlx.a
	@make -C $(MLX_IS) 2>/dev/null
	$(CC) $(CFLAGS) $(CINCLUDES) $(OBJS) $(MLX_OS) -o $(NAME)

# Compile each .c file into a .o file in bin/, creating subdirectories if needed
$(OBJDIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CINCLUDES) -c $< -o $@

# Build the mlx library
$(MLX_IS)libmlx.a:
	@make -C $(MLX_IS) all 2>/dev/null

clean:
	@make -C $(MLX_LINUX) clean 2>/dev/null
	@make -C $(MLX_MAC) clean 2>/dev/null
	@rm -rf $(OBJDIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
.SILENT:
