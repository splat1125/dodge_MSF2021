draw_self();

draw_set_font(fnt_one);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(5, 5, "You've been hit " + string(times_touched) + " times.");