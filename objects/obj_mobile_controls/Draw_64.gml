if (os_type == os_android || os_type == os_ios) {

    // ESQUERDA
    draw_sprite(Spr_direction_left, 0, 80, room_height - 120);

    // DIREITA
    draw_sprite(Spr_direction_right, 0, 200, room_height - 120);

    // PULO
    draw_sprite(Spr_direction_right, 0, room_width - 220, room_height - 120);

    // ATIRAR
    draw_sprite(Spr_button_atirar, 0, room_width - 100, room_height - 120);
}
/// Draw GUI

if (!(os_type == os_android || os_type == os_ios)) exit;

// esquerda
draw_sprite(Spr_direction_left, 0, 80, room_height - 140);

// direita
draw_sprite(Spr_direction_right, 0, 200, room_height - 140);

// pulo
draw_sprite(Spr_dpad_element_south, 0, room_width - 220, room_height - 140);

// atirar
draw_sprite(Spr_button_atirar, 0, room_width - 100, room_height - 140);
