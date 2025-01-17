with(other){
    if physics_test_overlap(bbox_left + 2, bbox_bottom + 2, 180,  obj_enemy) ||
                physics_test_overlap(bbox_right - 2, bbox_bottom + 2, 180, obj_enemy){
        physics_apply_impulse(x, y, 0, -jump_force*2)        
    } else {
        obj_game_controller.jumps-- 
        physics_apply_impulse(x, y, other.move_direction * jump_force/4, -jump_force*2)  
    }
}
instance_destroy(self);