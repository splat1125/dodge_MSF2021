draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_one);
draw_set_halign(fa_center);

draw_sprite(spr_gc, 0, room_width/2, room_height/2);
draw_sprite(spr_sig, 0, room_width/2, (room_height/2)-40);

if(alarm[1] != -1)
{
	if(flash_flipper >= 0 && flash_flipper <= 1)
	{
		draw_set_alpha(0);
		flash_flipper++;
	} else if(flash_flipper >= 2 && flash_flipper <= 3)
	{
		draw_set_alpha(1);
		flash_flipper++;
	} else if(flash_flipper == 4)
	{
		flash_flipper = 0;
	}
}
draw_text(room_width/2, (room_height/2)+40, "Press SPACE to BEGIN.");
draw_set_alpha(1);

if(alarm[1] <= 60 && alarm[1] != -1){
	fadetoblack_alpha += 1/45;
	draw_set_color(c_black);
	draw_set_alpha(fadetoblack_alpha);
	draw_rectangle(0, 0, 640, 480, false);
}