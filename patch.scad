
length = 100;
width = 1;
height = 40;

difference() {
  cube([width, height, length], center = true);


  for (i = [0:(length / 10)]) {
     translate([0, (height/2), ((length/2)-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-10, ((length/2)-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-5, (((length/2)-5)-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-15, (((length/2)-5)-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-20, (((length/2))-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-25, (((length/2)-5)-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-30, (((length/2))-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-35, (((length/2)-5)-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
     translate([0, (height/2)-40, (((length/2))-(i*10))]) rotate([0,90,0]) cylinder(d=5, h=6, center = true);
  }

} 

