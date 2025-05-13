#ifndef CUB3D_H
# define CUB3D_H

# include <sys/types.h>
# include <sys/stat.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdlib.h>
# include <stdio.h>
# include <math.h>
# include <string.h>
# include <stdbool.h>

# include "../libs/mlx_linux/mlx.h"
# include "../libs/mlx_mac/mlx.h"

# include "key.h"

#define R_WIDTH 500
#define R_HEIGHT 500

typedef struct s_img
{
	void		*img;
	void		*data;
	int			bpp;
	int			size_line;
	int			endian;
	int			height;
	int			width;
	char		*addr;
}	t_img;

typedef struct s_data
{
	t_img		img;
	void		*mlx;
	void		*win;
}			t_data;

void	setting(t_data *data);

#endif