// soapbox.scad - a simple soapbox

r = 35; // radius

    
// two spheres connected by a cylinder
module pill(r) {
    hull() {
        translate([-r,0,0]) sphere(r);
        translate([ r,0,0]) sphere(r);
    }
}

// soapbox solid: desired shape
module sbsolid(r) {
    module cutter(r) {
        cube([4*r, 2*r, r], center=true);
    }
    
    rotate([180,0,0]) {
        difference() {
            pill(r);
            // cut off "top" half
            translate([0,0,-0.5*r]) cutter(r);
            // make "bottom" flat
            translate([0,0,1.25*r]) cutter(r);
        }
    }
}

module soapbox(r) {
    s = 0.95; // shell size (inner to outer ratio)
    difference() {
        sbsolid(r);
        translate([0,0,0.05*r])
	    scale([s,s,s])
	        sbsolid(r);
    }
}

module holes(r) {
    h = 0.125*r; // hole size
    for (i = [-3:3]) {
        for (j = [-1:1]) {
            translate([i*3*h,j*3*h,0])
                translate([0,0,-1])
                    cylinder(10*h,h,h);
        }
    }
}

difference() {
    translate([0,0,0.75*r]) soapbox(r);
    holes(r);
}
