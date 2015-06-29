// retainer.scad
// headlight adjustment screw retainer for vw passat b2

$fn=30;

difference() {
    union() {
        // foot
        cylinder(3,9,9);
        // body
        translate([0,0,3])
            cylinder(2+7,d=11,d=11);
        // arms
        translate([0,0,3+2+(7/2)])
            cube([8,28,7],center=true);
    }
    // hole
    translate([0,0,-1]) 
        cylinder(20,d=4.2,d=4.2);
}