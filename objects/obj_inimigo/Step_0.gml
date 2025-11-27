// Atualiza referência ao player
if (!instance_exists(player)) player = obj_player;


// ===== TIMERS =====
if (attack_timer > 0) attack_timer--;
if (hurt_timer > 0) hurt_timer--;


// ===== FUNÇÕES DE TILE =====
function tile_solid(_x, _y) {
    return tilemap_get_at_pixel(tile_asfalto, _x, _y) != 0;
}

function tile_empty(_x, _y) {
    return tilemap_get_at_pixel(tile_asfalto, _x, _y) == 0;
}


// ===== DISTÂNCIA AO PLAYER =====
var dist = point_distance(x, y, player.x, player.y);


/// ====================================================================
///                        ESTADO: DEAD
/// ====================================================================
if (state == "dead") {
    sprite_index = Spr_zombie_dead;
    image_speed = 0.25;

    hspd = 0; // fica parado

    // quando a animação de morte terminar → destruir
    if (image_index >= image_number - 1) {
        instance_destroy();
    }

    exit; 
}


// ====================================================================
//                        ESTADO: HURT
// ====================================================================
if (state == "hurt") {
    sprite_index = Spr_zombie_hurt;
    image_speed = 0.35;

    hspd = 0; // parado ao tomar dano

    if (hurt_timer <= 0) {
        state = "patrol";
    }

    exit;
}


// ====================================================================
//                   INIMIGO ESTÁ PARADO (IDLE)
// ====================================================================
if (state == "idle") {

    sprite_index = Spr_zombie_idle;
    image_speed = 0.25;

    // quando player entrar no range → começa a andar
    if (dist < 300) {
        state = "patrol";
    }

    exit;
}


// ====================================================================
//                      ESTADO: PATROL
// ====================================================================
if (state == "patrol") {

    sprite_index = Spr_zombie_walk;
    image_speed = 0.30;

    x += hspd;

    // virar quando bater na parede ou sem chão
    var parede = tile_solid(x + hspd * 4, y);
    var sem_chao = tile_empty(x + hspd * 4, y + 8);

    if (parede || sem_chao) {
        hspd = -hspd;
        image_xscale = sign(hspd);
    }

    // player perto → perseguir
    if (dist < 250) {
        state = "chase";
    }

    // se muito longe → volta pro idle
    if (dist > 500) {
        state = "idle";
    }
}


// ====================================================================
//                      ESTADO: CHASE
// ====================================================================
if (state == "chase") {

    sprite_index = Spr_zombie_walk;
    image_speed = 0.35;

    image_xscale = sign(player.x - x);

    x += chase_speed * image_xscale;

    if (dist < 40) {
        state = "attack";
    }

    if (dist > 300) {
        state = "patrol";
    }
}


// ====================================================================
//                      ESTADO: ATTACK
// ====================================================================
if (state == "attack") {

    sprite_index = Spr_zombie_attack;
    image_speed = 0.40;

    if (attack_timer == 0) {
        global.life -= 1;
        attack_timer = 30; 
    }

    if (dist > 40) {
        state = "chase";
    }
}


// ====================================================================
//                          MORTE
// ====================================================================
if (hp <= 0 && state != "dead") {
    state = "dead";
    image_index = 0; // garante que a animação começa do zero
}
