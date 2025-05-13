#include "poke3D.h"

void	setting_mlx(t_data *data)
{
	data->mlx = mlx_init();
	data->win = mlx_new_window(data->mlx, R_WIDTH, R_HEIGHT, "");
	data->img.img = mlx_new_image(data->mlx, R_WIDTH, R_HEIGHT);
	data->img.addr = (char *)mlx_get_data_addr(data->img.img, &data->img.bpp,
			&data->img.size_line, &data->img.endian);
}

void	setting(t_data *data)
{
	setting_mlx(data);
}
