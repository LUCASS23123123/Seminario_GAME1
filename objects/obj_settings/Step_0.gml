if (mouse_check_button_pressed(mb_left)) {
    var mx = mouse_x;
    var my = mouse_y;

    if(mx > btn_x - btn_width/2 && mx < btn_x + btn_width) {
        if(my > btn_y_music && my < btn_y_music + btn_height) {
            global.music_on = !global.music_on;
        }
        if(my > btn_y_sfx && my < btn_y_sfx + btn_height) {
            global.sfx_on = !global.sfx_on;
        }
        if(my > btn_y_back && my < btn_y_back + btn_height) {
            room_goto(rm_menu);
        }
    }
}
