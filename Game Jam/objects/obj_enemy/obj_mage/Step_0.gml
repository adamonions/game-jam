// Ensure the path exists
if (!array_length(path_points)) exit;

// Get target position
var target_x = path_points[current_target];

// Get movement direction
var move_direction = point_direction(x, y, target_x, y);
var move_speed = 5; // Adjust for smoother movement

// Get current velocity
var vel_x = phy_linear_velocity_x;
var vel_y = phy_linear_velocity_y;
var current_speed = point_distance(0, 0, vel_x, vel_y);

// Apply force towards the target (only if not exceeding speed)
if (current_speed < move_speed * 5) { // Prevents excessive acceleration
    physics_apply_force(
        x, y, 
        lengthdir_x(move_speed, move_direction),
        lengthdir_y(move_speed, move_direction)
    );
}

// If close to target, switch to the next point
if (point_distance(x, y, target_x, y) < 5) {
    current_target = (current_target + 1) % array_length(path_points);
}
