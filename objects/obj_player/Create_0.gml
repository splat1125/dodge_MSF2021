global.camXT = room_width/2;
global.camYT = room_height/2;
manager = instance_create_depth(x, y + 100, depth+1, obj_battleManager);

manager._player = self;
