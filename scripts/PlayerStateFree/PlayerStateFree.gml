function PlayerStateFree() {
    script_execute(get_input);

    // --------------------------------------
    // FUNÇÃO DE COLISÃO
    // --------------------------------------
    function TileCollision(_x, _y, _list) {
        for (var i = 0; i < array_length(_list); i++) {
            if (tilemap_get_at_pixel(_list[i], _x, _y) != 0) {
                return true;
            }
        }
        return false;
    }

    // LISTA DE COLISÃO
    var _colisao = [ layer_tilemap_get_id("Tile_Asfalto") ];

    if (vspd >= 0) {
        array_push(_colisao, layer_tilemap_get_id("Tiles_passar"));
    }

    // --------------------------------------
    // MOVIMENTAÇÃO
    // --------------------------------------
    var move = key_right - key_left;

    hspd = move * spd;
    vspd += grv;

    if (hspd != 0) image_xscale = sign(hspd);

    if (key_jump && TileCollision(x, y + 1, _colisao)) {
        vspd = -8;
    }

    // --------------------------------------
    // COLISÃO HORIZONTAL
    // --------------------------------------
    var _velh = sign(hspd);
    repeat(abs(hspd)) {
        if (TileCollision(x + _velh, y, _colisao)) {
            hspd = 0;
            break;
        }
        x += _velh;
    }

    // --------------------------------------
    // COLISÃO VERTICAL
    // --------------------------------------
    var _velv = sign(vspd);
    repeat(abs(vspd)) {
        if (TileCollision(x, y + _velv, _colisao)) {
            vspd = 0;
            break;
        }
        y += _velv;
    }

    // --------------------------------------
    // SISTEMA DE TIRO (CORRIGIDO)
    // --------------------------------------

    // --- OFFSETS DO TIRO ---
    var offset_x = 40;    // distancia horizontal da mão
    var offset_y = -20;   // distancia vertical do ombro

    // se virar para esquerda
    if (image_xscale == -1) {
        offset_x = -offset_x;
    }

    // posição real para spawn
    var gun_x = x + offset_x;
    var gun_y = y + offset_y;

    // --- ATIRAR ---
    if (key_shoot && global.bullets > 0) {

        audio_play_sound(scar, 1, 0);

        with (instance_create_layer(gun_x, gun_y, "Shoot", obj_shoot)) {
            global.bullets--;

            // direção dependendo do lado
            direction = (other.image_xscale == 1) ? 0 : 180;
            speed = 14;
        }

        // duração da animação de tiro
        other.shoot_timer = 12;
    }

    // --------------------------------------
    // ANIMAÇÃO DO TIRO (PRIORIDADE MÁXIMA)
    // --------------------------------------
    if (shoot_timer > 0) {
        shoot_timer--;

        sprite_index = spr_player_shoot;
        image_speed = 1;

        exit;
    }

    // --------------------------------------
    // ANIMAÇÕES NORMAIS DO PLAYER
    // --------------------------------------
    if (!TileCollision(x, y + 1, _colisao)) {

        sprite_index = spr_player_jumpInicial;

        if (vspd > 0.5)
            sprite_index = spr_player_fall;

    } else {
        if (hspd != 0)
            sprite_index = spr_player_running;
        else
            sprite_index = spr_player_idle;
    }

    if (global.life < 1) game_restart();
}
