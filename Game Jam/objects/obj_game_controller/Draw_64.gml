function get_speed() {
    with(obj_player){
        var _vel = abs(phy_linear_velocity_x)
        if _vel = 0 {
            return 0
        } else if _vel < 25 {
            return 1
        } else if _vel < 50 {
            return 2
        } else if _vel < 75 {
            return 3
        } else if _vel < 100 {
            return 4
        } else if _vel < 125 {
            return 5
        } else if _vel < 150 {
            return 6
        } else if _vel < 200 {
            return 7
        } else if _vel < 250 {
            return 8
        } else if _vel <= 300 {
            return 9
        } else if _vel > 300 {
            return 10
        } else {
            return 0
        }
    }
}

// Clock face settings
var sx = 55; // X position of clock
var sy = 55; // Y position of clock
var radius = 50; // Clock face radius

// Get values
current_speed = clamp(get_speed(), 0, 10); // Speed as second hand

// Convert values to angles (spread evenly across 10 numerals, rotated so X is at the top)
var second_angle = lerp(previous_second_angle, -lerp(0, 360, current_speed / 10) + 90, 0.1); // Second hand
previous_second_angle = second_angle
var hour_angle = lerp(previous_hour_angle, -lerp(0, 360, jumps / 10)+ 90, 0.1); // Hour hand
previous_hour_angle = hour_angle

// Roman numeral labels (I - X)
var roman_numerals = [
    "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"
];

// Draw clock face
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_circle(sx, sy, radius, false);
draw_set_color(c_black)
draw_set_font(fnt_roman)

// Draw Roman numerals around the face (10 positions, rotated so X is at the top)
for (var i = 0; i < 10; i++) {
    var angle = -lerp(0, 360, (i+1) / 10) + 90; // Rotated so X (10) is at the top
    var num_x = sx + lengthdir_x(radius * 0.85, angle);
    var num_y = sy + lengthdir_y(radius * 0.85, angle);
    draw_text(num_x - 5, num_y - 5, roman_numerals[i]);
}

// Draw Jumps window
draw_set_font(fnt_roman_small)
draw_set_color(c_white)
draw_set_halign(fa_center)
var box_width = 20;
var box_height = 15;
var left_x = sx + 15;
var left_y = sy - 20;
draw_rectangle(left_x, left_y, left_x + box_width, left_y + box_height, true);
draw_set_color(c_black)
draw_text(left_x + 5, left_y + 5, "Jumps");
draw_set_font(fnt_roman)
draw_text(left_x + 5, left_y + 20, string(jumps));

// Draw Speed window
draw_set_font(fnt_roman_small)
draw_set_color(c_white)
var right_x = sx - 20;
var right_y = sy - 20;
draw_rectangle(right_x, right_y, right_x + box_width, right_y + box_height, false);
draw_set_color(c_black)
draw_text(right_x + 5, right_y + 5, "Speed");
draw_set_font(fnt_roman)
draw_text(right_x + 5, right_y + 20, string(current_speed));

// Draw second hand (speed)
var sec_length = radius * 0.9;
var sec_x = sx + lengthdir_x(sec_length, second_angle);
var sec_y = sy + lengthdir_y(sec_length, second_angle);
draw_set_color(c_red);
draw_line(sx, sy, sec_x, sec_y);
draw_circle(sec_x, sec_y, 3, false);

// Draw hour hand (jumps)
var hour_length = radius * 0.6;
var hour_x = sx + lengthdir_x(hour_length, hour_angle);
var hour_y = sy + lengthdir_y(hour_length, hour_angle);
draw_set_color(c_blue);
draw_line(sx, sy, hour_x, hour_y);
draw_circle(hour_x, hour_y, 5, false);

// Draw center dot
draw_set_color(c_black);
draw_circle(sx, sy, 3, false);








