function arrowkey_motion(_accl){
		//movement, up down left and right
		if(keyboard_check(vk_left) ^^ keyboard_check(vk_right))
		{
			hspeed = _accl * (keyboard_check(vk_right) - keyboard_check(vk_left));	//strictly motion left and right
		} else hspeed = 0;
		if(keyboard_check(vk_down) ^^ keyboard_check(vk_up))
		{
			vspeed = _accl * (keyboard_check(vk_down) - keyboard_check(vk_up));	//strictly motion left and right
		} else vspeed = 0;
		//collisions; these depend on a hitbox being there.. hm
		for(var i = 0; i <= abs(hspeed); i++)
		{
			if(!place_free(x+(sign(hspeed)*i), y))
			{
				hspeed = 0;
			}
		}
		for(var i = 0; i <= abs(vspeed); i++)
		{
			if(!place_free(x, y+(sign(vspeed)*i)))
			{
				vspeed = 0;
			}
		}
}