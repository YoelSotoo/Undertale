/// STEP EVENT - obj_inventory

// 1. OBTENER EL OBJETO DE CONTROLES
var touch = instance_find(obj_touch_controls, 0);

// 2. DETECTAR SI TOCASTE EL BOTÓN DE ARRIBA A LA DERECHA (La Mochila)
var abrir_inventario = false;

// Si existe el touch y presionaste el botón C (Mochila)
if (instance_exists(touch)) {
    if (touch.c_pressed) { // <--- ESTO LEE EL BOTÓN DE ARRIBA DERECHA
        abrir_inventario = true;
        // Reiniciamos la variable en el touch para que no parpadee
        touch.c_pressed = false; 
    }
}

// También permitimos abrir con la tecla 'I' del teclado por si acaso
if (keyboard_check_pressed(ord("I"))) abrir_inventario = true;


// 3. ABRIR O CERRAR
// Si detectamos la señal y no estamos en la tienda
if (abrir_inventario && room != rm_shop) {
    visible = !visible;
    global.inventory_open = visible;
}

// SI ESTÁ CERRADO, NO HACEMOS NADA MÁS
if (!visible) return;

// =========================================================
// 4. NAVEGACIÓN DENTRO DEL INVENTARIO (Solo si está abierto)
// =========================================================

var key_up = keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(vk_down);
var key_accept = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);

// Soporte táctil para navegar en el menú
if (instance_exists(touch)) {
    if (touch.up_pressed) key_up = true;
    if (touch.down_pressed) key_down = true;
    if (touch.z_pressed) key_accept = true;
}

// Mover cursor
if (key_up) {
    cursor = max(0, cursor - 1);
    if (cursor < top_index) top_index = cursor;
    audio_play_sound(snd_seleccionar, 1, false);
}

if (key_down) {
    cursor = min(array_length(items) - 1, cursor + 1);
    if (cursor >= top_index + items_per_page)
        top_index = cursor - (items_per_page - 1);
    audio_play_sound(snd_seleccionar, 1, false);
}

// Usar ítem
if (key_accept) {
    if (array_length(items) > 0) {
        var it = items[cursor];
        
        // -- TU LÓGICA DE ITEMS --
        var se_uso = true;
        
        switch(it.id) {
            case "Tutu":
                global.player_hp += 5;
                audio_play_sound(snd_consumir, 1, false);
                break;
            case "PayLimon":
                global.player_hp += 10;
                audio_play_sound(snd_consumir, 1, false);
                break;
            case "tp_ciudad":
                room_goto(rm_ciudad);
                break;
            default:
                se_uso = false;
                break;
        }

        if (se_uso) {
            it.count--;
            if (it.count <= 0) array_delete(items, cursor, 1);
        }
    }
}