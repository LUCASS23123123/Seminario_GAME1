/// get_input()

// --------------------------------------
// RESET DAS ENTRADAS
// --------------------------------------
key_left  = 0;
key_right = 0;
key_jump  = 0;
key_shoot = 0;

// --------------------------------------
// ENTRADAS DE TECLADO (PC)
// --------------------------------------
if (os_type != os_android && os_type != os_ios) {
    key_left  = keyboard_check(ord("A"));
    key_right = keyboard_check(ord("D"));
    key_jump  = keyboard_check_pressed(vk_space);
    key_shoot = keyboard_check_pressed(ord("J"));
}

// --------------------------------------
// ENTRADAS DE TOQUE (MOBILE)
// --------------------------------------
if (os_type == os_android || os_type == os_ios) {

    var mx = device_mouse_x(0);
    var my = device_mouse_y(0);
    var pressed = device_mouse_check_button(0, mb_left);
    var just_pressed = device_mouse_check_button_pressed(0, mb_left);

    // BOTÃO: ANDAR ESQUERDA
    if (point_in_rectangle(mx, my, 20, room_height - 180, 140, room_height - 60)) {
        if (pressed) key_left = 1;
    }

    // BOTÃO: ANDAR DIREITA
    if (point_in_rectangle(mx, my, 160, room_height - 180, 280, room_height - 60)) {
        if (pressed) key_right = 1;
    }

    // BOTÃO: PULAR
    if (point_in_rectangle(mx, my, room_width - 280, room_height - 180, room_width - 160, room_height - 60)) {
        if (just_pressed) key_jump = 1;
    }

    // BOTÃO: ATIRAR
    if (point_in_rectangle(mx, my, room_width - 140, room_height - 180, room_width - 20, room_height - 60)) {
        if (just_pressed) key_shoot = 1;
    }
}
