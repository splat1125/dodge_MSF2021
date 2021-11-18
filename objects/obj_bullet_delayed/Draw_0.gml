image_xscale = 0.75;
image_yscale = 0.75;
image_angle = direction;
if(alarm[0] == -1)
{
	draw_self();
	if(x < obj_battleManager.BB_x1 || x > obj_battleManager.BB_x2 || y < obj_battleManager.BB_y1 || y > obj_battleManager.BB_y2 || place_meeting(x, y, obj_player))
	{
		for(var i = 0; i <= 20; i++)
		{
			var spark = instance_create_depth(x, y, depth, obj_explodespark);	
			spark.direction = random(360)
			spark.speed = random_range(1, 2);
		}
		if(place_meeting(x, y, obj_player))
		{
			obj_player.times_touched += 1;
		}
		instance_destroy();
	}
} else if(alarm[0] > 0)
{
	grow += 1/delay;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * grow, image_yscale * grow, image_angle, c_white, grow);
}


