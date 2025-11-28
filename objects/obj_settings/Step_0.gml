if (mouse_check_button_pressed(mb_left)) {
    var mx = mouse_x;
    var my = mouse_y;

    if (mx > btn_x - btn_width/2 && mx < btn_x + btn_width) {

        // ON/OFF MÚSICA
        if (my > btn_y_music && my < btn_y_music + btn_height) {
            global.music_on = !global.music_on;
        }

        // ON/OFF EFEITOS
        if (my > btn_y_sfx && my < btn_y_sfx + btn_height) {
            global.sfx_on = !global.sfx_on;
        }

        // Voltar
        if (my > btn_y_back && my < btn_y_back + btn_height) {
            room_goto(rm_menu);
        }
    }
}

// CONTROLE DE VOLUME (setinhas ou teclado)
if (keyboard_check_pressed(vk_left)) {
    global.music_volume = max(0, global.music_volume - 0.1);
}
if (keyboard_check_pressed(vk_right)) {
    global.music_volume = min(1, global.music_volume + 0.1);
}
