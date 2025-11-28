/// ==============================================
/// Step Event - obj_inimigo
/// ==============================================

// ----------------------------
// 1️⃣ Atualiza referência ao player
// ----------------------------
if (!instance_exists(player)) player = obj_player;

// ----------------------------
// 2️⃣ Timers
// ----------------------------
if (attack_timer > 0) attack_timer--;
if (hurt_timer > 0) hurt_timer--;

// ----------------------------
// 3️⃣ Verifica colisão com tiros
// ----------------------------
var inst_shoot = instance_place(x, y, obj_shoot);
if (inst_shoot != noone) {
    with (inst_shoot) {
        // destrói o tiro se encostar no inimigo vivo
        if (!other.death_invulnerable) {
            other.hp -= 1;
            other.hurt_timer = 15;
            other.state = "hurt";

            instance_destroy(id); // destrói o tiro
        }
        // Se inimigo morto, o tiro passa
    }
}

// ----------------------------
// 4️⃣ Tilemap functions
// ----------------------------
function tile_solid(_x, _y) {
    return tilemap_get_at_pixel(tile_asfalto, _x, _y) != 0;
}

function tile_empty(_x, _y) {
    return tilemap_get_at_pixel(tile_asfalto, _x, _y) == 0;
}

// ----------------------------
// 5️⃣ Distância até o player
// ----------------------------
var dist = point_distance(x, y, player.x, player.y);

// ----------------------------
// 6️⃣ Estado: DEAD
// ----------------------------
if (state == "dead") {
    death_invulnerable = true; // invulnerável
    death_timer++;

    sprite_index = Spr_zombie_dead;
    image_speed = 0.25;
    hspd = 0;

    if (image_index >= image_number - 1) {
        instance_destroy();
    }
    exit;
}

// ----------------------------
// 7️⃣ Estado: HURT
// ----------------------------
if (state == "hurt") {
    sprite_index = Spr_zombie_hurt;
    image_speed = 0.35;
    hspd = 0;

    if (hurt_timer <= 0) {
        state = "patrol";
    }
    exit;
}

// ----------------------------
// 8️⃣ Estado: IDLE
// ----------------------------
if (state == "idle") {
    sprite_index = Spr_zombie_idle;
    image_speed = 0.25;

    if (dist < 300) state = "patrol";
    exit;
}

// ----------------------------
// 9️⃣ Estado: PATROL
// ----------------------------
if (state == "patrol") {
    sprite_index = Spr_zombie_walk;
    image_speed = 1;

    x += hspd;

    var parede = tile_solid(x + hspd , y);
    var sem_chao = tile_empty(x + hspd , y );

    if (parede || sem_chao) {
        hspd = -hspd;
        image_xscale = sign(hspd);
    }

    if (dist < 300) state = "chase";
    if (dist > 301) state = "idle";
}

// ----------------------------
// 10️⃣ Estado: CHASE
// ----------------------------
if (state == "chase") {
    sprite_index = Spr_zombie_walk;
    image_speed = 0.35;

    image_xscale = sign(player.x - x);
    x += chase_speed * image_xscale;

    if (dist < 40) state = "attack";
    if (dist > 300) state = "patrol";
}

// ----------------------------
// 11️⃣ Estado: ATTACK
// ----------------------------
if (state == "attack") {
    sprite_index = Spr_zombie_attack;
    image_speed = 0.40;

    if (attack_timer == 0) {
        global.life -= 1;
        attack_timer = 30;
    }

    if (dist > 40) state = "chase";
}

// ----------------------------
// 12️⃣ Checa morte
// ----------------------------
if (hp <= 0 && state != "dead") {
    state = "dead";
    image_index = 0; // garante que a animação começa do zero
}
