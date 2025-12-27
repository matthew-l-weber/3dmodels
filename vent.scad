
length = 180;
width = 2;
overhang = 15;
height = 30;

difference() {
  cube([width, height, length], center = true);
  translate([0, (-height/2+4), (length/2) - 5]) rotate([0,90,0]) cylinder(d=2, h=6, center = true);
  translate([0, (-height/2+4), (-length/2) + 5]) rotate([0,90,0]) cylinder(d=2, h=6, center = true);

  for (i = [0:(length / 10)]) {
     translate([0, (height/2), ((length/2)-(i*10))]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
     translate([0, (height/2)-10, ((length/2)-(i*10))]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
     translate([0, (height/2)-5, (((length/2)-5)-(i*10))]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
     translate([0, (height/2)-15, (((length/2)-5)-(i*10))]) rotate([0,90,0]) cylinder(d=4, h=6, center = true);
  }

} 


translate([0, -8, length / 4]) rotate([0,0,0]) cube([overhang, width+1, 4]);
translate([0, -8, -length / 4]) rotate([0,0,0]) cube([overhang, width+1, 4]);
translate([8, -8, 0]) rotate([0,0,5]) cube([overhang, width, length - 20], center = true);