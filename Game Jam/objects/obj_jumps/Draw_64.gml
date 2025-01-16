draw_set_font(fnt_score)
draw_set_halign(fa_center)
draw_set_color(c_white);
draw_text(75,10, string_concat("Jumps \n", jumps))

function get_speed() {
    with(obj_player){
        var _vel = abs(phy_linear_velocity_x)
        if _vel < 25 {
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

// Speedometer position on the screen
var sx = 500;  // X position of the dial
var sy = 60;  // Y position of the dial
var radius = 50; // Radius of the speedometer dial

// Get the current speed (0-10)

current_speed = get_speed();
show_debug_message(current_speed)
// Map current speed (0-10) to an angle (-120° to 120°)
var angle = lerp(-120, 120, current_speed/10);

// Draw the circular dial background
draw_set_color(c_white);
draw_circle(sx, sy, radius, false);

// Draw tick marks (optional)
draw_set_color(c_gray);
for (var i = 0; i <= 10; i++) {
    var tick_angle = lerp(-120, 120, i / 10);
    var tick_x1 = sx + lengthdir_x(radius * 0.8, tick_angle);
    var tick_y1 = sy + lengthdir_y(radius * 0.8, tick_angle);
    var tick_x2 = sx + lengthdir_x(radius, tick_angle);
    var tick_y2 = sy + lengthdir_y(radius, tick_angle);
    draw_line(tick_x1, tick_y1, tick_x2, tick_y2);
}

// Draw the needle
var needle_length = radius * 0.8;
var needle_x = sx + lengthdir_x(needle_length, angle);
var needle_y = sy + lengthdir_y(needle_length, angle);

draw_set_color(c_red);
draw_line(sx, sy, needle_x, needle_y);

// Draw speed value at the bottom
draw_set_font(fnt_speed)
if current_speed < 10 {
    draw_set_color(c_white);
} else {
    draw_set_color(c_red);
}
draw_text(sx - 10, sy + radius + 15, string(current_speed));
