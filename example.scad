include <fgcad.scad>
include <laserscad.scad>;

thickness = 3;
x = 300;
y = 150;

translate([0, -100]) {
    lpart("top30", [x, y]) {
        linear_extrude(height = thickness) {
            difference() {
                square([x, y], center = true);
                vewlix(button_nominal_diameter = 30);
            }
        }
    }
}

translate([0, 100]) {
    lpart("top24", [x, y]) {
        linear_extrude(height = thickness) {
            difference() {
                square([x, y], center = true);
                vewlix(button_nominal_diameter = 24);
            }
        }
    }
}