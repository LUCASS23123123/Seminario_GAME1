btn_x = room_width / 2;
btn_y_start = 250;
btn_spacing = 70;
btn_width = 200;
btn_height = 40;

/// Evento Create do obj_menu

// Desliga a visibilidade da camada "Background" da sala, só por segurança
var _layer_id = layer_get_id("Background");
if (layer_exists(_layer_id)) {
    layer_set_visible(_layer_id, false);
}