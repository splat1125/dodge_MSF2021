if(!manager.battleBoundsActive || manager.transitionPhase)
{
	speed = 0;
	afterimage_create(x, y, 10, sprite_index, image_index, image_angle);
}

if(manager.battleBoundsActive && !manager.transitionPhase)
{
	arrowkey_motion(1);
}
if(charging) speed = 0;