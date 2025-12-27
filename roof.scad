

difference() {
  cube([2, 20, 100], center = true);
  translate([0, -4, 45]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, -4, -45]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);

} 

translate([0, -3, 0]) rotate([-5,0,0]) cube([25, 2, 40]);
translate([0, -1, 1]) rotate([-175,0,0]) cube([25, 2, 41]);
translate([0, -1, -1.5]) rotate([0,0,0]) cube([25, 3, 3]);