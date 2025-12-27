

difference() {
  cube([2, 60, 150], center = true);
  translate([0, 18, 0]) cube([4, 18, 80], center = true);
  translate([0, -15, 70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, -15, -70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, 15, -70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, 15, 70]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
} 

translate([0, -20, 0]) rotate([-5,0,0]) cube([25, 2, 60]);
translate([0, -18, 1]) rotate([-175,0,0]) cube([25, 2, 61]);
translate([0, 27, -50]) rotate([0,0,2]) cube([30,3,100]);
translate([0, -18, -3]) rotate([0,0,0]) cube([25, 4, 4]);