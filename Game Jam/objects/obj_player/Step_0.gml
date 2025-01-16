function is_on_ground() {
    return physics_test_overlap(bbox_left + 2, bbox_bottom + 2, direction,  obj_collision) ||
            physics_test_overlap(bbox_right - 2, bbox_bottom + 2, direction, obj_collision);
}

function is_ground_above() {
    return physics_test_overlap(bbox_left + 2, bbox_top + 2, direction,  obj_collision) ||
                physics_test_overlap(bbox_right - 2, bbox_top+ 2, direction, obj_collision); 
}

function get_jump_force() {
    var _speed = obj_jumps.current_speed
    return -jump_force * (1 + _speed/10)
}

if(keyboard_check(vk_left)){
    physics_apply_local_force(x, y, - move_force, 0)
} 
if(keyboard_check(vk_right)){
    physics_apply_local_force(x, y, move_force, 0)
}
if(keyboard_check_pressed(vk_up) && is_on_ground()){
    show_debug_message("{0} Jumps remaining", obj_jumps.jumps)
    if obj_jumps.jumps > 0 && !is_ground_above(){
        physics_apply_impulse(other.x, other.y, 0, get_jump_force())    
        obj_jumps.jumps--
    } 
}
if(keyboard_check(vk_down)) {
    physics_apply_impulse(x, y, 0, jump_force*0.5)
}