if (obj_controllerrm_pasillo.game_start) {
    timer += 1;

    // Solo crear obstáculo si no hay ninguno
    if (timer > irandom_range(120, 150) &&
        instance_number(obj_obstaculoperro) +
        instance_number(obj_perrocomiendo) +
        instance_number(obj_avion) +
        instance_number(obj_agua) == 0)
    {
        // Elegir índice aleatorio
        var i = irandom(array_length(obstaculos) - 1);

        // Elegir objeto y altura en base al índice
        var obj_random = obstaculos[i];
        var pos_y = obstaculos_y[i];

        // Crear instancia en la room
        instance_create_layer(room_width, pos_y, "Instances", obj_random);

        // Sonido
        audio_play_sound(snd_bark, 0, false);

        timer = 0;
    }
}
