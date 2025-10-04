// Estado inicial
estado_menu = "principal";

// Opciones
opciones_principal = ["Comprar","Hablar","Vender","Salir"];
opciones_comprar = ["Espada de plastico 5G","Cono de nieve 15G","Bufanda protectora 15G","Regresar"];
opciones_vender  = ["Regresar"];
opciones_hablar  = ["Q royo","la hrmna del","vendes pan?","Regresar"];

respuestas_hablar = [
    "* Kiubole que andas asiendo\npor aqui",
    "* Esta vien buena we",
    "* No puto",
    ""
];

// Sprites de Hablar
spr_hablar = [
    spr_elweydelatienda1, // Opción 0
    spr_elweydelatienda3, // Opción 1 (ejemplo animado)
    spr_elweydelatienda5  // Opción 2
];

// Cursor
cursor_index = 0;
spr_indicador = spr_cursor;

// Hablar
opcion_hablar_actual = -1;
sprite_hablar_actual = noone;
texto_actual = "";

// Animación
anim_offset = 0;

// Música
audio_play_sound(snd_musicatienda, 0, true);
image_speed = 0.08;
