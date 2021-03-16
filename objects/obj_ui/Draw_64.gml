/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_font(fnt_score);

var p0 = instance_find(obj_player, 0);

draw_set_halign(fa_left);
draw_text(0, 0, p0.points);

var p1 = instance_find(obj_player, 1);

draw_set_halign(fa_right);
draw_text(room_width-5, 0, p1.points);
