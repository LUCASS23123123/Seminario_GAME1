if (mouse_check_button_pressed(mb_left)) {
    var mx = mouse_x;
    var my = mouse_y;

    for (var i = 0; i < 4; i++) {
        var bx = btn_x - btn_width/2;
        var by = btn_y_start + i * btn_spacing;
        if (mx > bx && mx < bx + btn_width && my > by && my < by + btn_height) {
            switch (i) {
                case 0: room_goto(rm_game); break;
                case 1: room_goto(rm_settings); break;
                case 2: room_goto(rm_credits); break;
                case 3: game_end(); break;
            }
        }
    }
}
