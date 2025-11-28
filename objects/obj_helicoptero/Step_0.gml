// Distância entre player e helicóptero
var dist = point_distance(x, y, obj_player.x, obj_player.y);

// Player dentro do alcance?
if (dist <= sound_range)
{
    if (global.sfx_on)
    {
        if (!audio_is_playing(sound_id))
        {
            sound_id = audio_play_sound(vertBg1, 1, true);
        }

        audio_sound_gain(sound_id, global.sfx_volume, 0);
    }
    else
    {
        if (audio_is_playing(sound_id))
            audio_stop_sound(sound_id);
    }
}
else
{
    if (audio_is_playing(sound_id))
        audio_stop_sound(sound_id);
}


// --------------------------------------
// TROCAR DE FASE (Room1 → Room2, Room2 → rm_menu)
// --------------------------------------
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, false))
{
    // Para o som
    if (audio_is_playing(sound_id)) {
        audio_stop_sound(sound_id);
    }

    // Se estiver na Room1 → vai para Room2
    if (room == Room1) {
        room_goto(Room2);
    }

    // Se estiver na Room2 → volta para o menu
    if (room == Room2) {
        room_goto(rm_menu);
    }
}
