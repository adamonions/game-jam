function is_on_ground() {
    return physics_test_overlap(bbox_left + 2, bbox_bottom + 2, direction,  obj_collision) ||
            physics_test_overlap(bbox_right - 2, bbox_bottom + 2, direction, obj_collision);
}

function is_ground_above() {
    return physics_test_overlap(bbox_left + 2, bbox_top + 2, direction,  obj_collision) ||
                physics_test_overlap(bbox_right - 2, bbox_top+ 2, direction, obj_collision); 
}

function get_jump_force() {
    return -jump_force * (1 + obj_game_controller.current_speed/10)
}

if(keyboard_check(vk_left) || keyboard_check(ord("A"))){
    physics_apply_local_force(x, y, - move_force, 0)
} 
if(keyboard_check(vk_right) || keyboard_check(ord("D"))){
    physics_apply_local_force(x, y, move_force, 0)
}
if((keyboard_check_pressed(vk_up) || keyboard_check(ord("W"))) && is_on_ground()){
    if obj_game_controller.jumps > 0 && !is_ground_above(){
        physics_apply_impulse(x, y, 0, get_jump_force())    
        obj_game_controller.jumps--
    } 
}
if(keyboard_check(vk_down)||keyboard_check(ord("S")||keyboard_check(vk_space))) {
    physics_apply_impulse(x, y, 0, jump_force*0.5)
}