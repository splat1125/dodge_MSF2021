global.shakevar = 0;	//for the screenshake manager
global.camXT = 0;		//desired positions for the battleboundaries
global.camYT = 0;
global.room = 0;		//room tracker

surface_resize(application_surface, room_width, room_height);
var windowscale = 2;
window_set_size(windowscale * room_width, windowscale * room_height);
alarm[0] = 1;