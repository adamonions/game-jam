function is_on_right_side() {
    return physics_test_overlap(bbox_right - 2, bbox_top + 2, direction,  obj_collision) ||
           physics_test_overlap(bbox_right - 2, bbox_bottom- 2, direction, obj_collision); 
    
}
function is_on_left_side() {
    return physics_test_overlap(bbox_left + 2, bbox_top + 2, direction,  obj_collision) ||
                        physics_test_overlap(bbox_left + 2, bbox_bottom- 2, direction, obj_collision); 
}

if obj_game_controller.current_speed >= 10 {
    var _crash = false
    var _move_force = move_force * 1.5
    if is_on_left_side(){
        _crash = true
    } else if is_on_right_side(){
        _crash = true
        _move_force = -_move_force
    }
    
    if _crash {
        if obj_game_controller.jumps > 0 {
            physics_apply_impulse(x, y, _move_force, -jump_force*1.5)
            obj_game_controller.jumps--
        } else {
            alarm_set(0, 25)
            physics_apply_impulse(x, y, 0, -jump_force*4)
        }
    }
    
}
