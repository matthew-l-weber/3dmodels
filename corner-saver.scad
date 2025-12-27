length = 70;
width = 1;
height = 50;

staple_length = 20;
staple_height = 10;

difference() {
   cube([width, height, length]);
   //translate([0, 5, 5]) rotate([0,0,0]) cube([1, staple_height, staple_length]);
   //translate([0, height-staple_height-5, length-staple_length-5 ]) rotate([0,0,0]) cube([1, staple_height, staple_length]);
   //translate([0,  5, length-staple_length-5 ]) rotate([0,0,0]) cube([1, staple_height, staple_length]);
   //translate([0,  height-staple_height-5, 5 ]) rotate([0,0,0]) cube([1, staple_height, staple_length]);

   translate([-1,  -5, 30 ]) rotate([55,0,0]) cube([4, length, height/2]);


}
difference() {
   rotate([0,90,0]) cube([width, height, length]);
   //translate([5, 5, -1]) rotate([0,90,0]) cube([1, staple_height, staple_length]);
   //translate([length-staple_length-5, height-staple_height-5, -1 ]) rotate([0,90,0]) cube([1, staple_height, staple_length]);
   //translate([5, height-staple_height-5, -1 ]) rotate([0,90,0]) cube([1, staple_height, staple_length]);
   //translate([length-staple_length-5, 5, -1 ]) rotate([0,90,0]) cube([1, staple_height, staple_length]);

   rotate([0,90,0]) translate([-1,  -5, 30 ]) rotate([55,0,0]) cube([4, length, height/2]);   
}



translate([-1, 0, 0]) rotate([0,0,0]) cube([2, 2, length]/2);
translate([-1, 0, 0]) rotate([0,90,0]) cube([2, 2, length/2]);
translate([-1, height-2, 0]) rotate([0,0,0]) cube([2, 2, length]);
translate([-1, height-2, 0]) rotate([0,90,0]) cube([2, 2, length]);
translate([-1, height/2, 0]) rotate([0,0,0]) cube([2, 2, length]);
translate([-1, height/2, 0]) rotate([0,90,0]) cube([2, 2, length]);

translate([-1, 0, length/2]) rotate([0,0,0]) cube([2, height, 2]);
translate([-1, 0, -2]) rotate([0,0,0]) cube([2, height, 2]);
translate([-1, height/2, length-2]) rotate([0,0,0]) cube([2, height/2, 2]);
translate([length-3, height/2 ,-2 ]) rotate([0,0,0]) cube([2, height/2, 2]);
translate([length/2-1, 0 ,-2 ]) rotate([0,0,0]) cube([2, height, 2]);
