with(other) {
    physics_apply_impulse(x, y, 0, get_jump_force() * other.spring_power)  
}