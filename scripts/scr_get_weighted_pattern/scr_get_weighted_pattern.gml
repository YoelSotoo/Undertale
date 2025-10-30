function scr_get_weighted_pattern() {
    var patterns = [
        { name: "basic", weight: 30 },    // 30% probabilidad
        { name: "basic_5", weight: 25 },  // 25% probabilidad  
        { name: "circle", weight: 20 },   // 20% probabilidad
        { name: "rain", weight: 15 },     // 15% probabilidad
        { name: "spiral", weight: 10 }    // 10% probabilidad
    ];
    
    var total_weight = 0;
    for (var i = 0; i < array_length(patterns); i++) {
        total_weight += patterns[i].weight;
    }
    
    var random_value = random(total_weight);
    var current_weight = 0;
    
    for (var i = 0; i < array_length(patterns); i++) {
        current_weight += patterns[i].weight;
        if (random_value <= current_weight) {
            return patterns[i].name;
        }
    }
    
    return "basic";
}