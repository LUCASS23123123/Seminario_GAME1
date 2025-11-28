if (room != Room1 && room != Room2) {
    instance_destroy();
}
/// Create

// TAMANHO DA TOUCH AREA (maior que o sprite para facilitar)
btn_left  = rectangle(20, room_height - 200, 140, room_height - 80);
btn_right = rectangle(160, room_height - 200, 280, room_height - 80);

btn_jump  = rectangle(room_width - 280, room_height - 200, room_width - 160, room_height - 80);
btn_shoot = rectangle(room_width - 140, room_height - 200, room_width - 20, room_height - 80);

// valores usados pelo player
global.touch_left  = 0;
global.touch_right = 0;
global.touch_jump  = 0;
global.touch_shoot = 0;
// Criar áreas dos botões usando structs
btn_left  = { x1: 20,  y1: room_height - 200, x2: 140, y2: room_height - 80 };
btn_right = { x1: 160, y1: room_height - 200, x2: 280, y2: room_height - 80 };
btn_jump  = { x1: room_width - 280, y1: room_height - 200, x2: room_width - 160, y2: room_height - 80 };
btn_shoot = { x1: room_width - 140, y1: room_height - 200, x2: room_width - 20,  y2: room_height - 80 };
