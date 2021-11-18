sinevar += pi/60;

if(keyboard_check_pressed(ord("R"))) room_goto(st_a_setup);

if(!battleBoundsActive || transitionPhase)	//moving the player to the start position
{
	if(alarm[0] == -1)
	{
		plr_x_dif = plr_x_tgt - _player.x;
		plr_y_dif = plr_y_tgt - _player.y;
		
		alarm[0] = setup_time;
	}
	_player.x += plr_x_dif/setup_time;
	_player.y += plr_y_dif/setup_time;
} 
if(transitionPhase)
{
	if(alarm[2] == -1)
	{
		switch(global.room)
		{
			case(0):
				bounds_changeTo(160, 190, 345, 214, 45);
				boundChangeInterval = alarm[2];
				global.room++;
				break;
			case(1):
				bounds_changeTo(25, 25, 185, 280, 45);
				boundChangeInterval = alarm[2];
				global.room++;
				break;
			case(2):
				bounds_changeTo(25, 25, 49, 100, 45);
				boundChangeInterval = alarm[2];
				global.room++;
				break;
		}

	}
	BB_x1 += BBx1_diff / boundChangeInterval;
	BB_y1 += BBy1_diff / boundChangeInterval;
	BB_x2 += BBx2_diff / boundChangeInterval;
	BB_y2 += BBy2_diff / boundChangeInterval;
}
//time to make Bullet Patterns...
if(!transitionPhase && battleBoundsActive)
{
	if(fire_delay == 0)
	{
		switch(global.room)
		{
			case(0):
				instance_create_depth(mean(BB_x1, BB_x2), mean(BB_y1, BB_y2), depth + 1, obj_bullet_generic).direction = 225 + 45*sin(sinevar);
				instance_create_depth(mean(BB_x1, BB_x2), mean(BB_y1, BB_y2), depth + 1, obj_bullet_generic).direction = 45 + 45*sin(sinevar);
				fire_delay = 10;
				break;
			case(1):
				repeat(2) instance_create_depth(BB_x1+30, mean(BB_y1, BB_y2) + choose(-8, 0, 8), depth + 1, obj_bullet_delayed);
				fire_delay = 45;
				break;
			case(2):
				if(alternated)
				{
					for(var i = 0; i < 7; i++)
					{
						var laser = instance_create_depth(choose(BB_x1, BB_x2), BB_y1 + 30 + (i * 22), depth + 1, obj_laser_delayed)
						if(laser.x == BB_x1) laser.direction = 0 else laser.direction = 180;
					}
					alternated = false;
				} else if(!alternated)
				{
					for(var i = 0; i < 7; i++)
					{
						var laser = instance_create_depth(choose(BB_x1, BB_x2), BB_y1 + 39 + (i * 22), depth + 1, obj_laser_delayed)
						if(laser.x == BB_x1) laser.direction = 0 else laser.direction = 180;
					}
					alternated = true;
				}
				repeat(4) instance_create_depth(random_range(BB_x1, BB_x2), BB_y1 + 35, depth + 1, obj_bullet_delayed).direction = -90;
				fire_delay = 60;
				break;
		}
	}
	if(fire_delay > 0)
	{
		fire_delay--;
	}
}