if (place_meeting(x + move_direction * 5, y, obj_collision)) {
    // Reverse direction and flip the sprite
    move_direction *= -1;
    image_xscale = move_direction;
}

// Check if character is on the ground

if (!place_meeting(x, y + 5, obj_collision)) {
    if falling{
        return
    }
    touching_ground = false;
    move_direction *= -1;
    image_xscale = move_direction;
} else {
    touching_ground = true;
    falling = false;
}

// Apply movement force if on the ground
if (touching_ground) {
    physics_apply_force(x, y, move_direction * move_speed, 0);
}