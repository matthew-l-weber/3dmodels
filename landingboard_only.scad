

difference() {
  cube([2, 20, 100], center = true);
  translate([0, -3, 0]) cube([4, 18, 60], center = true);
  translate([0, -5, 45]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  translate([0, -5, -45]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
} 

translate([0, 9, -50]) rotate([0,0,4]) cube([40,1,100]);
translate([0, 7, -50]) cube([2,3,100]);