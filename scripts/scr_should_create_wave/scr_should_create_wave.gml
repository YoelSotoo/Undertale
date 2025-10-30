function should_create_wave(_pattern) {
    // Solo estos patrones crean oleadas adicionales
    switch (_pattern) {
        case "rain":
        case "basic_5":
            return true;
        default:
            return false;
    }
}