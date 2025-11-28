/// ===========================================
/// Step Event - obj_shoot
/// ===========================================

// ----------------------------
// 1️⃣ Lista de colisão (chão)
// ----------------------------
var _colisao = [ layer_tilemap_get_id("Tile_Asfalto") ];
// Se precisar de outros tiles, use:
// array_push(_colisao, layer_tilemap_get_id("Tiles_passar"));

// ----------------------------
// 2️⃣ Movimento do tiro
// ----------------------------
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// ----------------------------
// 3️⃣ Colisão com o chão
// ----------------------------
for (var i = 0; i < array_length(_colisao); i++) {
    if (tilemap_get_at_pixel(_colisao[i], x, y) != 0) {
        instance_destroy();
        exit; // sai do Step Event
    }
}

// ----------------------------
// 4️⃣ Colisão com inimigos
// ----------------------------
var inst_inimigo = instance_place(x, y, obj_inimigo);
if (inst_inimigo != noone) {
    with (inst_inimigo) {
        if (!death_invulnerable) {  // só toma dano se não estiver morrendo
            hp -= 1;
            hurt_timer = 15;
            state = "hurt";

            instance_destroy(other); // destrói o tiro
        }
        // Se estiver invulnerável (morrendo), o tiro passa
    }
}

// ----------------------------
// 5️⃣ Destruição por distância percorrida
// ----------------------------
var dist_traveled = point_distance(x_start, y_start, x, y);
if (dist_traveled >= max_distance) {
    instance_destroy();
    exit;
}
