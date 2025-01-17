draw_set_font(fmt_roman_huge)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
if next_spawn_index == 9 {
    draw_text((room_width-64) / 2, (room_height-64) / 2, "X");
    return
}
draw_text((room_width-64) / 2, 100, "GAME");
draw_text((room_width-64) / 2, room_height - 100, "OVER");

time_elapsed++;

if (next_spawn_index < 10 && time_elapsed >= next_spawn_index * num_spawn_interval) {
    numeral_data[next_spawn_index] = {
        size: 10, // Initial small size
        alpha: 0, // Initial transparency
        x: random_range(100, room_width - 100), // Random starting x-position
        y: random_range(128, room_height - 150), // Random starting y-position
        speed: random_range(3, 10.5) // Random speed factor
    };
    next_spawn_index++;
}


for (var i = 0; i < next_spawn_index; i++) {
    if (i < array_length(numeral_data)) {
        numeral_data[i].size += numeral_data[i].speed; // Increase size over time
        numeral_data[i].alpha += 0.02; // Increase visibility
        if (numeral_data[i].alpha >= 1) numeral_data[i].alpha = 1;
        
        // Scale up "X" significantly larger
         if (i == 9) {
             draw_set_font(fmt_roman_huge)
        } else {
             draw_set_font(fnt_roman)
        }
        draw_set_alpha(numeral_data[i].alpha);
        draw_set_color(c_white);
        draw_text(numeral_data[i].x, numeral_data[i].y, roman_numerals[i]);
    }
}
draw_set_alpha(1);

