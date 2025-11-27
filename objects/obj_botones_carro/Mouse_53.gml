// NO HACER NADA si el juego no ha iniciado
if (!obj_controllerrm_pasillo.game_start) exit;

// Obtener posición táctil
var mx = device_mouse_x(0);
var my = device_mouse_y(0);

// =====================
// SALTAR
// =====================
if (point_in_circle(mx, my, btn_saltar_x, btn_saltar_y, btn_radius))
{
    touch_saltar = true;

    with (obj_carrisk)
    {
        if (!global.saltando)
        {
                saltando = true;
				vel_y = -12;
				audio_play_sound(snd_jump, 0, false);
				global.saltando = true;
        }
    }
}

// =====================
// CLAXON
// =====================
if (point_in_circle(mx, my, btn_claxon_x, btn_claxon_y, btn_radius))
{
    touch_claxon = true;
    audio_play_sound(snd_beep, 0, false);
    global.claxon_touch = true;
}
