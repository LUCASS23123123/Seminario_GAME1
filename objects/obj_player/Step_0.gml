#region controle
key_right = keyboard_check(ord("D"));
key_left  = keyboard_check(ord("A"));
key_jump  = keyboard_check_pressed(vk_space);
key_shoot = keyboard_check_pressed(ord("J")); //atira
#endregion

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
var flipped = direction;
var gun_x = (x+64) * (flipped)
var _xx = x + lengthdir_x(15,image_angle)
var y_offset = lengthdir_y(-20,image_angle)

if key_shoot and global.bullets > 0
{
	audio_play_sound(scar,1,0)
	with (instance_create_layer(_xx,y+10,"Shoot",obj_shoot))
{
global.bullets --;
//velocidade do tiro
speed = 10;
// direcao
direction = -90 + 90 * other.image_xscale;
//angulo
image_angle = direction;
}
}
#endregion

