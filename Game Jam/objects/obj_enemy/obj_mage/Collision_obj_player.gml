with(other){
    if physics_test_overlap(bbox_left + 2, bbox_bottom + 2, 180,  obj_mage) ||
                physics_test_overlap(bbox_right - 2, bbox_bottom + 2, 180, obj_mage){
        physics_apply_impulse(x, y, 0, -jump_force/2)        
    } else {
        obj_jumps.jumps--   
    }
}
instance_destroy(self);