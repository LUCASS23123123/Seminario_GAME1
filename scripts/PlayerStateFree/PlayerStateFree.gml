function PlayerStateFree() {
    script_execute(get_input);

    // --------------------------------------
    // Função interna para checar colisão
    // --------------------------------------
    function TileCollision(_x, _y, _list) {
        for (var i = 0; i < array_length(_list); i++) {
            if (tilemap_get_at_pixel(_list[i], _x, _y) != 0) {
                return true;
            }
        }
        return false;
    }

    // --------------------------------------
    // MOVIMENTAÇÃO
    // --------------------------------------
    var move = key_right - key_left;

    var _colisao = [
        layer_tilemap_get_id("Tile_Asfalto")
    ];

    if (vspd >= 0) {
        array_push(_colisao, layer_tilemap_get_id("Tiles_passar"));
    }

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
    // SISTEMA DE TIRO
    // --------------------------------------
    var flip = (image_xscale == -1);
    var offset_x = 0;
    var offset_y = -280;

    if (flip) offset_x = -offset_x;

    var gun_x = x + lengthdir_x(offset_x, image_angle);
    var gun_y = y + lengthdir_y(offset_y, image_angle);

    if (key_shoot && global.bullets > 0) {
        audio_play_sound(scar, 1, 0);

        with (instance_create_layer(gun_x, gun_y, "Shoot", obj_shoot)) {
            global.bullets--;
            speed = 100;
            direction = -90 + 90 * other.image_xscale;
            image_angle = direction;
        }

        shoot_timer = 12; /// ATIVA O SPRITE DE TIRO POR 12 FRAMES
    }

    // --------------------------------------
    // SPRITE DE TIRO (PRIORITÁRIO)
    // --------------------------------------
    if (shoot_timer > 0) {
        shoot_timer--;

        sprite_index = spr_player_shoot;
        image_speed = 1;

        exit; // impede que outra animação sobrescreva
    }

    // --------------------------------------
    // TROCA DE SPRITES NORMAL
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
