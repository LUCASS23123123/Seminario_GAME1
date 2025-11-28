if global.life =  4
draw_sprite(spr_life,4,100,62)
if global.life =  3
draw_sprite(spr_life,3,100,62)
if global.life =  2
draw_sprite(spr_life,2,100,62)
if global.life =  1
draw_sprite(spr_life,1,100,62)
if global.life =  0
draw_sprite(spr_life,0,100,62)
if (os_type == os_android || os_type == os_ios) {

    // esquerda
    draw_sprite(Spr_direction_left, 0, 80, room_height - 120);

    // direita
    draw_sprite(Spr_direction_right, 0, 220, room_height - 120);

    // pular
    draw_sprite(Spr_dpad_element_south, 0, room_width - 220, room_height - 120);

    // atirar
    draw_sprite(Spr_button_atirar, 0, room_width - 80, room_height - 120);
}
