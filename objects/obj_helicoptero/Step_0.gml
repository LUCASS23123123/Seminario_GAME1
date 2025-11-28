// Tocar som quando o player estiver próximo
// DISTÂNCIA PARA TOCAR O SOM
sound_range = 600;

// Verifica a distância do player
var dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dist <= sound_range) {
    // se o som não está tocando, toca
    if (!audio_is_playing(vertBg1)) {
        audio_play_sound(vertBg1, 1, 1); // loop = 1
    }
} else {
    // se estiver fora do range, para o som
    if (audio_is_playing(vertBg1)) {
        audio_stop_sound(vertBg1);
    }
}

// Checar colisão com o player para mudar de fase
if (place_meeting(x, y, obj_player)) {
    audio_stop_sound(vertBg1); // garante que o som pare
    room_goto(Room2);
}
