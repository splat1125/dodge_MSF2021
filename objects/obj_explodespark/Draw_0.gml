draw_set_color(c_white);
draw_set_alpha(image_alpha);
var mult = alarm[0]/initlife;
draw_rectangle(x, y, x+1*mult, y+1*mult, false);
draw_set_alpha(1);