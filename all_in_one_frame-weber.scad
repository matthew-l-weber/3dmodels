bee_space = 7;

/*
// 3 make a 3/4d frame
frame_height = 177;
frame_width = (465 / 3) - bee_space * 2;
frame_spacing = 33;
frame_bar_width = 23;

bar_thickness = 3;
tab_length = bee_space;
tab_notch = 8;
spacing_tab_width = 10;
corner_size = 10;
groove_depth = 3;
groove_width = 3;
*/

// Apidea compatible?
frame_height = 50;
frame_width = 105;
frame_spacing = 34;
frame_bar_width = 23;

bar_thickness = 3;
tab_length = 6;
tab_notch = 8;
spacing_tab_width = 10;
corner_size = 10;
groove_depth = 3;
groove_width = 3;

groove1_y = frame_bar_width/2-bar_thickness-groove_width/2;
groove2_y = frame_bar_width/2+groove_width/2;

module grooved_tab() {
    translate([-tab_length, 0, 0])
        cube([tab_length, frame_bar_width/2-tab_notch/2, bar_thickness]);
    translate([-tab_length, frame_bar_width/2+tab_notch/2, 0])
        cube([tab_length, frame_bar_width/2-tab_notch/2, bar_thickness]);
}

module top_bar() {
    difference() {
        translate([-frame_width/2, 0, frame_height - bar_thickness])
            cube([frame_width, frame_bar_width/2-groove_width/2, bar_thickness]);
        translate([0, -(frame_spacing-frame_bar_width)/2, 0])
            cylinder(r=12, h=1e3);
    }
    
    translate([-frame_width/2, frame_bar_width/2-2, frame_height - bar_thickness])
        cube([frame_width, frame_bar_width/2+2, bar_thickness]);
    
    // Top Groove
    translate([-frame_width/2, groove2_y-2, frame_height - bar_thickness - groove_depth])
        cube([frame_width, 1, groove_depth]);
    
    //translate([-frame_width/2, groove2_y, frame_height - bar_thickness - groove_depth])
    //    cube([frame_width, bar_thickness, groove_depth]);
    
    
    // Tabs
    translate([-frame_width/2, 0, frame_height-bar_thickness])
        grooved_tab();
    translate([frame_width/2+tab_length, 0, frame_height-bar_thickness])
        grooved_tab();
    
    // Spacers
    translate([-frame_width/2, -(frame_spacing-frame_bar_width)/2, frame_height - spacing_tab_width])
        cube([bar_thickness, frame_spacing, spacing_tab_width]);
    
    translate([frame_width/2-bar_thickness, -(frame_spacing-frame_bar_width)/2, frame_height - spacing_tab_width])
        cube([bar_thickness, frame_spacing, spacing_tab_width]);
}

module corner() {
    hull() {
        translate([-groove_depth, 0, 1])
            cube([1, 1, 1e-3]);
        translate([-groove_depth, 0, corner_size+1])
            cube([1, 1, 1e-3]);
        translate([-groove_depth-corner_size, 0, 1])
            cube([1, 1, 1e-3]);
    }
}

module side_bar() {
    x_offset = frame_width/2-bar_thickness;
    translate([x_offset, 0, 0])
        cube([bar_thickness, frame_bar_width, frame_height]);
    
    //translate([x_offset-groove_depth, groove1_y, 0])
    //    cube([groove_depth, bar_thickness, frame_height]);
    
    translate([x_offset-groove_depth, groove2_y-2, 0])
        cube([groove_depth, 1, frame_height]);
    
    //translate([x_offset, groove1_y, 0])
    //    corner();
    //translate([x_offset, groove2_y, 0])
    //    corner();

    translate([frame_width/2, groove2_y-2, frame_height])
        mirror([0, 0, 1])
            corner();
    
    // Corner bottom
    //translate([x_offset-groove_depth-corner_size, groove1_y, 0])
    //    cube([groove_depth+corner_size, groove2_y-groove1_y+bar_thickness, bar_thickness]);
}

top_bar();
side_bar();
translate([0, frame_bar_width, 0])
    rotate([0, 0, 180])
        side_bar();