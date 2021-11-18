speed = 250;
var xul = x + hspeed;
var yul = y + vspeed;
/*
if(xul > BB_x2 || xul < BB_x1)
{
	if(xul > BB_x2)
	{
		var xdif = abs(xul - BB_x2);	//how much right-er we went
		var xdist = abs(x - xul);	//total distance we have travelled
		var ypctcut = xdist/xdif;		//part/total defines a proportion we need to cut off of our vspeed coord
		
		yul = y + (vspeed - (vspeed * ypctcut)) 
	} else
	{
		var xdif = abs(xul - BB_x1);	//how much left-er we went
		var xdist = abs(x - xul);	//total distance we have travelled
		var ypctcut = xdist/xdif;		//part/total defines a proportion we need to cut off of our vspeed coord
		
		yul = y + (vspeed - (vspeed * ypctcut))
	}
}
*/
if(xul > BB_x2) xul = BB_x2;
if(yul > BB_y2) yul = BB_y2;
if(xul < BB_x1) xul = BB_x1;
if(yul < BB_y1) yul = BB_y1;

speed = 0; //literally using speed only for the vector maths that it makes possible
tgtresolve_x = xul;
tgtresolve_y = yul;
//ABOVE - laser resolution code

image_xscale = point_distance(x, y, tgtresolve_x, tgtresolve_y) / 2;
image_angle = point_direction(x, y, tgtresolve_x, tgtresolve_y);


if(alarm[0] == -1)
{
	draw_self();
	image_yscale += -0.01;
	repeat(2)
	{
		var spark = instance_create_depth(random_range(bbox_left, bbox_right), y + choose(1, -1), depth, obj_explodespark);	
		spark.direction = direction;
		spark.speed = random_range(1, 2);
		spark.sparkarc = choose(-2, -1, 1, 2);
		spark.image_alpha = 0.75
	}
	if(place_meeting(x, y, obj_player) && !has_hit_player)
	{
		obj_player.times_touched += 1;
		has_hit_player = true;
	}
} else if(alarm[0] > 0)
{
	grow += 1/delay;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * grow * 0.5, image_angle, c_white, grow / 2);
}