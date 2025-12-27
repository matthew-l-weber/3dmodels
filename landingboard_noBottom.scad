

difference() {
  cube([2, 60, 150], center = true);
  translate([0, 20, 0]) cube([4, 21, 80], center = true);
  translate([0, -15, 70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, -15, -70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, 15, -70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, 15, 70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
} 

translate([0, -20, 0]) rotate([-5,0,0]) cube([30, 2, 60]);
translate([0, -18, 1]) rotate([-175,0,0]) cube([30, 2, 61]);
translate([0, -18, -3]) rotate([0,0,0]) cube([30, 4, 4]);