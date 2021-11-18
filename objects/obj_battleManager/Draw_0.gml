if(battleBoundsActive && !transitionPhase)
{
	switch(global.room)
	{
		case(0):
			if(collision_rectangle(BB_x1, BB_y1, BB_x1+25, BB_y1+25, obj_player, false, true))
			{
				timeSpent++;
			} else if(timeSpent > 0)
			{
				timeSpent--;
			}
			if(timeSpent >= 60)
			{
				plr_x_tgt = round(mean(BB_x1, BB_x1+25));
				plr_y_tgt = round(mean(BB_y1, BB_y1+25));
				timeSpent = 0;
				transitionPhase = true;
				battleBoundsFlash= true;
			}
			draw_set_alpha(0.5*((timeSpent+60)/60));
			draw_set_color(c_red);
			draw_rectangle(BB_x1, BB_y1, BB_x1+25, BB_y1+25, false);
			break;
		case(1):
			if(collision_rectangle(BB_x1, BB_y1, BB_x1+25, BB_y2, obj_player, false, true))
			{
				timeSpent++;
			} else if(timeSpent > 0)
			{
				timeSpent--;
			}
			if(timeSpent >= 60)
			{
				plr_x_tgt = round(mean(BB_x1, BB_x1+25));
				plr_y_tgt = round(mean(BB_y1, BB_y2) + 50);
				timeSpent = 0;
				transitionPhase = true;
				battleBoundsFlash= true;
			}
			draw_set_alpha(0.5*((timeSpent+60)/60));
			draw_set_color(c_red);
			draw_rectangle(BB_x1, BB_y1, BB_x1+25, BB_y2, false);
			break;
		case(2):
			if(collision_rectangle(BB_x2, BB_y1, BB_x1, BB_y1 + 25, obj_player, false, true))
			{
				timeSpent++;
			} else if(timeSpent > 0)
			{
				timeSpent--;
			}
			if(timeSpent >= 60)
			{
				plr_x_tgt = round(mean(BB_x1, BB_x1 + 25));
				plr_y_tgt = round(mean(BB_y1, BB_y1 + 25));
				timeSpent = 0;
				transitionPhase = true;
				battleBoundsFlash= true;
			}
			draw_set_alpha(0.5*((timeSpent+60)/60));
			draw_set_color(c_red);
			draw_rectangle(BB_x2, BB_y1, BB_x1, BB_y1 + 25, false);
			break;
		case(3):
			draw_text(mean(BB_x1, BB_x2), mean(BB_y1, BB_y2), "that is all i have for now");
			break;
	}
}


if(battleBoundsActive || transitionPhase)
{
	draw_set_alpha(1);
	draw_set_color(c_white)
	draw_rectangle(BB_x1, BB_y1, BB_x2, BB_y2, true);
	draw_rectangle(BB_x1-1, BB_y1-1, BB_x2+1, BB_y2+1, true);
	if(battleBoundsFlash)
	{
		if(alarm[1] == -1)
		{
			alarm[1] = 15;
		}
		draw_set_alpha(alarm[1]/15);
		draw_rectangle(BB_x1-2, BB_y1-2, BB_x2+2, BB_y2+2, false);
	}
}