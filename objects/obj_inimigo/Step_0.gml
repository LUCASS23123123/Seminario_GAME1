/// ==============================================
/// Step Event - obj_inimigo (CORRIGIDO)
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
        if (!other.death_invulnerable) {
            other.hp -= 1;
            other.hurt_timer = 15;
            other.state = "hurt";
            instance_destroy(id); 
        }
    }
}

// ----------------------------
// 4️⃣ Tilemap functions (Ajustadas)
// ----------------------------
function tile_solid(_x, _y) {
    // Verifica se existe tile sólido naquele ponto
    return tilemap_get_at_pixel(tile_asfalto, _x, _y) != 0;
}

// ----------------------------
// 5️⃣ Distância até o player
// ----------------------------
var dist = point_distance(x, y, player.x, player.y);

// ----------------------------
// 6️⃣ Estado: DEAD
// ----------------------------
if (state == "dead") {
    death_invulnerable = true;
    death_timer++;
    sprite_index = Spr_zombie_dead;
    image_speed = 0.25;
    hspd = 0;
    if (image_index >= image_number - 1) instance_destroy();
    // Não usamos 'exit' aqui para permitir que a gravidade (lá no final) funcione no corpo morto
}

// ----------------------------
// 7️⃣ Estado: HURT
// ----------------------------
else if (state == "hurt") {
    sprite_index = Spr_zombie_hurt;
    image_speed = 0.35;
    hspd = 0;
    if (hurt_timer <= 0) state = "patrol";
}

// ----------------------------
// 8️⃣ Estado: IDLE
// ----------------------------
else if (state == "idle") {
    sprite_index = Spr_zombie_idle;
    image_speed = 0.25;
    hspd = 0; // Garante que não deslize
    if (dist < 300) state = "patrol";
}

// ----------------------------
// 9️⃣ Estado: PATROL
// ----------------------------
else if (state == "patrol") {
    sprite_index = Spr_zombie_walk;
    image_speed = 1;

    // Só move se não houver parede na frente
    // Checa parede um pouco a frente e um pouco acima do pé (y - 16)
    var parede = tile_solid(x + hspd * 15, y - 16);
    
    // Checa se TEM chão na frente (abaixo do bounding box)
    var tem_chao = tile_solid(x + hspd * 15, bbox_bottom + 2);

    // Se bater na parede OU não tiver chão, vira
    if (parede || !tem_chao) {
        hspd = -hspd;
        image_xscale = sign(hspd);
    } else {
        x += hspd;
    }

    if (dist < 300) state = "chase";
    if (dist > 301) state = "idle";
}

// ----------------------------
// 🔟 Estado: CHASE (CORRIGIDO)
// ----------------------------
else if (state == "chase") {
    sprite_index = Spr_zombie_walk;
    image_speed = 0.35;

    // Define a direção
    var _dir = sign(player.x - x);
    if (_dir != 0) image_xscale = _dir;
    
    // Calcula o movimento desejado
    var _move_x = chase_speed * _dir;

    // --- Colisão Horizontal no Chase ---
    // Verifica se vai bater na parede antes de mover
    if (!tile_solid(x + _move_x * 10, y - 16)) {
        x += _move_x;
    } 
    // Se quiser que ele pare em buracos também, descomente a linha abaixo:
    // else if (!tile_solid(x + _move_x * 10, bbox_bottom + 2)) { /* Para na borda */ }

    if (dist < 40) state = "attack";
    if (dist > 400) state = "patrol"; // Aumentei um pouco para ele não desistir tão fácil
}

// ----------------------------
// 1️⃣1️⃣ Estado: ATTACK
// ----------------------------
else if (state == "attack") {
    sprite_index = Spr_zombie_attack;
    image_speed = 0.40;
    hspd = 0; // Para de andar ao atacar

    if (attack_timer == 0) {
        global.life -= 1;
        attack_timer = 30;
    }

    if (dist > 40) state = "chase";
}

// ----------------------------
// 1️⃣2️⃣ Checa morte
// ----------------------------
if (hp <= 0 && state != "dead") {
    state = "dead";
    image_index = 0;
}

// ==============================================
// 🆕 GRAVIDADE E COLISÃO VERTICAL (ESSENCIAL)
// ==============================================
// Isso impede que eles flutuem ou entrem no chão

// 1. Aplica gravidade
vspd += 0.4; 

// 2. Colisão Vertical com Tile
// Se tiver chão no pé + vspd
if (tile_solid(x, bbox_bottom + vspd)) {
    // Encosta pixel por pixel
    while (!tile_solid(x, bbox_bottom + sign(vspd))) {
        y += sign(vspd);
    }
    vspd = 0; // Zera velocidade ao tocar o chão
}

// 3. Aplica movimento vertical
y += vspd;