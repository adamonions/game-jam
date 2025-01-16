function is_on_right_side() {
    return physics_test_overlap(bbox_right - 2, bbox_top + 2, direction,  obj_collision) ||
                    physics_test_overlap(bbox_right - 2, bbox_bottom- 2, direction, obj_collision); 
    
}

if is_on_right_side() && phy_linear_velocity_x > 300 {
    physics_apply_impulse(x, y, - move_force*1.5, -jump_force*1.5)
    obj_jumps.jumps--
}