// Verifica se a munição não está cheia
if (global.bullets < global.bullets_max) {

    // Adiciona, por exemplo, 10 balas
    global.bullets += 4;

    // Trava no máximo (para não ficar com 35/30 balas)
    if (global.bullets > global.bullets_max) {
        global.bullets = global.bullets_max;
    }

    // Toca som de recarga
    audio_play_sound(snd_recarga, 10, false);

    // Destrói a caixa
    instance_destroy();
}