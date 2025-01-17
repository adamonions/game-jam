function is_on_ground() {
    return physics_test_overlap(bbox_left + 2, bbox_bottom + 2, direction,  obj_collision) ||
           physics_test_overlap(bbox_right - 2, bbox_bottom + 2, direction, obj_collision);
}

function is_ground_above() {
    return physics_test_overlap(bbox_left + 2, bbox_top + 2, direction,  obj_collision) ||
           physics_test_overlap(bbox_right - 2, bbox_top+ 2, direction, obj_collision); 
}

function get_jump_force() {
    return -jump_force * (1 + obj_game_controller.current_speed/10 + obj_game_controller.jumps/10)
}

function get_keys(keys) {
    for (var i = 0; i < array_length(keys); i++) {
            if (keyboard_check(keys[i])) {
                return true
            }
        }
    return false;
}

function get_keys_pressed(keys) {
    for (var i = 0; i < array_length(keys); i++) {
            if (keyboard_check_pressed(keys[i])) {
                return true
            }
        }
    return false;    
}

if get_keys_pressed([vk_up, vk_space, ord("W")]) {
    if obj_game_controller.jumps > 0 && !is_ground_above(){
        physics_apply_impulse(x, y, 0, get_jump_force())    
        obj_game_controller.jumps--
    } 
}
if get_keys([vk_left, ord("A")]) {
    physics_apply_local_force(x, y, - move_force, 0)
}
if get_keys([vk_right, ord("D")]) {
    physics_apply_local_force(x, y, move_force, 0)
}
if get_keys([vk_down, ord("S")]) {
    physics_apply_impulse(x, y, 0, jump_force*0.5)
}