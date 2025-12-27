
dim = 175;
dim_inner = dim-30;
height = 8;
hole = 5;
gap = 10;

difference() {
   cylinder(d=dim, h=height, center = true);
   translate([0, 0, 2]) cylinder(d=dim_inner, h=height, center = true);

difference() {
   cylinder(d=dim/2, h=height/2, center = true);
   translate([0, 0, 2]) cylinder(d=(dim/2)-5, h=height/2, center = true);
}
   for (i = [0:8:(dim_inner / 2)-4]) {
       for(variable = [0 : 360/i : 360]) {
          rotate([0,0,variable]) translate([i,0,-height/2]) cylinder(d=hole, h=height, center=true);   
       }
   }


//  for (i = [-(dim_inner / 2):gap+hole:(dim_inner / 2)]) {
//     if(i > -(dim_inner / 2) && i < (dim_inner / 2)) {
//         for (j = [-(dim_inner / 2):gap+hole:(dim_inner / 2)]) {
//            if(j > -(dim_inner / 2) && j < (dim_inner / 2)) {
//               echo(i,j);
//               translate([i, j, -height/2]) cylinder(d=hole, h=height/2, center = true);
//            }
//         }
//     }
//  }
}

cylinder(d=23, h=height/2, center = true);

