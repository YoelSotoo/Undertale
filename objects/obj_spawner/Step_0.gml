if (obj_controllerrm_pasillo.game_start) {

    timer += 1;

    if (timer > irandom_range(120, 150) &&
        instance_number(obj_obstaculoperro) +
        instance_number(obj_perrocomiendo) +
        instance_number(obj_goldcarro) +
        instance_number(obj_agua) == 0)
    {
        // Elegir índice aleatorio
        var i = irandom(array_length(obstaculos) - 1);

        // Elegir objeto, posición y sonido según índice
        var obj_random = obstaculos[i];
        var pos_y     = obstaculos_y[i];
        var snd_random = obstaculos_sonidos[i];

        // Crear instancia
        instance_create_layer(room_width, pos_y, "Instances", obj_random);

        // Reproducir sonido correspondiente al spawn
        audio_play_sound(snd_random, 0, false);

        // Reset de timer
        timer = 0;
    }
}
