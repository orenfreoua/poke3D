#include "poke3D.h"

int	close_window(t_data *data)
{
    (void)data;
	exit(0);
}

int	raycasting(t_data *data)
{
    (void)data;
	return (0);
}


void	game_loop(t_data *data)
{
	mlx_loop_hook(data->mlx, &raycasting, data);
	if (!OS)
		mlx_hook(data->win, 33, 1L << 5, close_window, data);
	else
		mlx_hook(data->win, 17, 0, close_window, data);
	mlx_loop(data->mlx);
}

int	main()
{
	t_data	data;

	bzero(&data, sizeof(t_data));
	setting(&data);
	game_loop(&data);
	return (EXIT_SUCCESS);
}
