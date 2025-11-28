// Distância entre player e helicóptero
var dist = point_distance(x, y, obj_player.x, obj_player.y);

// Player dentro do alcance?
if (dist <= sound_range)
{
    if (global.sfx_on)
    {
        // Se o som ainda não está tocando
        if (!audio_is_playing(sound_id))
        {
            sound_id = audio_play_sound(vertBg1, 1, true);
        }

        // Atualizar volume sempre
        audio_sound_gain(sound_id, global.sfx_volume, 0);
    }
    else
    {
        // SFX desligado → parar som se estiver tocando
        if (audio_is_playing(sound_id))
            audio_stop_sound(sound_id);
    }
}
else
{
    // Fora do range → parar som
    if (audio_is_playing(sound_id))
        audio_stop_sound(sound_id);
}
// --------------------------------------
// MUDAR DE FASE AO ENCOSTAR NO HELICÓPTERO
// --------------------------------------
if (place_meeting(x, y, obj_player)) {

    // Para o som do helicóptero caso esteja tocando
    if (audio_is_playing(sound_id)) {
        audio_stop_sound(sound_id);
    }

    // Troca para a Room2
    room_goto(Room2);
}
