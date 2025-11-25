
function PlayerStateFree(){
script_execute(get_input())
#region movimentacao
var move = key_right - key_left;

hspd = move * spd;

// gravidade
vspd += grv;

// virar sprite
if (hspd != 0) image_xscale = sign(hspd);

// pulo
if (key_jump && place_meeting(x, y + 1, Obj_wall))
{
    vspd = -8;
}

// colisão horizontal
if place_meeting(x + hspd, y, Obj_wall)
{
    while (!place_meeting(x + sign(hspd), y, Obj_wall))
    {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// colisão vertical
if place_meeting(x, y + vspd, Obj_wall)
{
    while (!place_meeting(x, y + sign(vspd), Obj_wall))
    {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;
#endregion


#region sistema de tiro

// Detecta flip
var flip = (image_xscale == -1);

// OFFSET DO CANO (origem BOTTOM-CENTER)
// x: +51 px | y: -63 px
var offset_x = 0;
var offset_y = -280;

// Inverte offset se virar
if (flip) offset_x = -offset_x;

// Aplica rotação do sprite
var gun_x = x + lengthdir_x(offset_x, image_angle);
var gun_y = y + lengthdir_y(offset_y, image_angle);

if (key_shoot && global.bullets > 0)
{
    audio_play_sound(scar,1,0);

    with (instance_create_layer(gun_x, gun_y, "Shoot", obj_shoot))
    {
        global.bullets--;

        // velocidade do tiro
        speed = 100;

        // direção do tiro baseada no flip
        direction = -90 + 90 * other.image_xscale;

        // rotaciona visualmente
        image_angle = direction;
    }
}

#endregion


#region Troca os sprites

if (!place_meeting(x, y + 1, Obj_wall))
{
    sprite_index = spr_player_jumpInicial;

    if (sign(vspd) > 0.5)
        sprite_index = spr_player_fall;
    else
        sprite_index = spr_player_jumpInicial;
}
else
{
    if (hspd != 0)
    {
        sprite_index = spr_player_running;
    }

    if (hspd == 0)
    {
        if (place_meeting(x, y + 1, Obj_wall))
        {
            sprite_index = spr_player_idle;
        }

        if (hspd != 0)
        {
            if (place_meeting(x, y + 1, Obj_wall))
            {
                sprite_index = spr_player_running;
            }
        }
    }
}

#endregion

#region reset jogo
if global.life < 1 {
	game_restart();
}
#endregion
}