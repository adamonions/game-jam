
function apply_mouse_impulse() {
    var mx = device_mouse_x(0);
    var my = device_mouse_y(0);
    var dx = x - mx;
    var dy = y - my;
    var distance = point_distance(mx, my, x, y);
    
    if (distance < 15) { // Increased detection range for mouse impact
        var force = 500; // Reduced force for a weaker impact
        var impulse_x = (dx / distance) * force;
        var impulse_y = (dy / distance) * force;
        
        physics_apply_impulse(x, y, impulse_x, impulse_y); // Apply weaker impulse
    }
}

apply_mouse_impulse();
