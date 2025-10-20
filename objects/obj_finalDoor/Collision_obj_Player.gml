if (other.tp_cooldown <= 0) {
    other.tp_cooldown = 15;
    room_goto(target_room);
}
