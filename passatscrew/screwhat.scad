// screwhat.scad
// headlight adjustment screw hat for vw passat b2

$fn=30;

module slit() {
    translate([0,0,0.5])
        cube([42,1,3+2+3+0.5]);
}

difference() {
    union() {
        // foot
        cylinder(3,8,8);
        // body
        translate([0,0,3])
            cylinder(3+3+2,5,5);
        // cap
        translate([0,0,3+2+3+3])
            cylinder(2,5,4);
        // wings
        translate([0,0,3])
            cylinder(3+2+3,6,5);
    }
    union() {
        // internal hole (fat)
        translate([0,0,-1])
            cylinder(3+2+3+2+1,4,4);
        // external hole (end)
        translate([0,0,3+2+3+2])
            cylinder(2,4,3);
        // through hole (slim)
        translate([0,0,-1])
            cylinder(20,3,3);
        // slits
        slit();
        rotate([0,0,120]) slit();
        rotate([0,0,-120]) slit();
    }
}
