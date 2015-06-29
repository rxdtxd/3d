// led sword handle for ideefixe

$fn=30;

// battery compartment
bcw = 32;        // width/depth (internal)
bch = 112+14+30; // height: battery holders + switch
                 // ends + tube insert
wall = 2;        // wall thickness
module bc(width, height) {
    minkowski() {
        cr = 4;  // cube 2.0 corner radius
        cube([width-cr*2, width-cr*2, height], center=true);
        cylinder(r=cr, h=0.0001);
    }
}

// switch hole
shw = 8.8;  // width
shd = 14;   // depth
module sh(width, depth) {
    cube([width, depth, 42], center=true);
}

difference() {
    translate([0,0,-wall]) bc(bcw+wall*2, bch+wall);
    bc(bcw, bch);
    translate([0,0,-bch/2]) {
        sh(shw, shd);
        translate([shw/2+3*wall,0,0]) sh(shw, shd);
        translate([-(shw/2+3*wall),0,0]) sh(shw, shd);
    }
}
