// Botão direita
var br = draw_sprite(Spr_direction_right, 0, 800, 900);

// Botão esquerda
var bl = draw_sprite(Spr_direction_left, 0, 700, 900);

// Botão pular
var bj = draw_sprite(Spr_button_jump, 0, 100, 900);

// Botão atirar
var bs = draw_sprite(Spr_button_atirar, 0, 1200, 900);
draw_sprite(Spr_direction_left,  0, btn_left.x1  + 60, btn_left.y1  + 60);
draw_sprite(Spr_direction_right, 0, btn_right.x1 + 60, btn_right.y1 + 60);
draw_sprite(Spr_dpad_element_south, 0, btn_jump.x1  + 60, btn_jump.y1  + 60);
draw_sprite(Spr_button_atirar, 0, btn_shoot.x1 + 60, btn_shoot.y1 + 60);
