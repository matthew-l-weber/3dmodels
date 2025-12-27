bee_space = 7;

use <honeycomb.scad>;

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
frame_height = 105;
frame_width = 105;
frame_spacing = 34;
frame_bar_width = 23;

bar_thickness = 3;
tab_length = 6;
tab_notch = 8;
spacing_tab_width = 10;
corner_size = 10;

draw = 0;

module grooved_tab() {
    translate([-tab_length, 0, 0])
        cube([tab_length, frame_bar_width/2-tab_notch/2, bar_thickness]);
    translate([-tab_length, frame_bar_width/2+tab_notch/2, 0])
        cube([tab_length, frame_bar_width/2-tab_notch/2, bar_thickness]);
}

module top_bar() {
    difference() {
        translate([-frame_width/2, 0, frame_height - bar_thickness])
            cube([frame_width, frame_bar_width, bar_thickness]);
        translate([0, -(frame_spacing-frame_bar_width)/2, 0])
            cylinder(r=12, h=1e3);
    }
    
    // Tabs
    translate([-frame_width/2, 0, frame_height-bar_thickness])
        grooved_tab();
    translate([frame_width/2+tab_length, 0, frame_height-bar_thickness])
        grooved_tab();
    
    translate([-frame_width/2, -(frame_spacing-frame_bar_width)/2, frame_height - spacing_tab_width])
        cube([bar_thickness, frame_spacing, spacing_tab_width]);
    
    translate([frame_width/2-bar_thickness, -(frame_spacing-frame_bar_width)/2, frame_height - spacing_tab_width])
        cube([bar_thickness, frame_spacing, spacing_tab_width]);
}

module side_bar() {
    x_offset = frame_width/2-bar_thickness;
    translate([x_offset, 0, 0])
        cube([bar_thickness, frame_bar_width, frame_height]);
}

top_bar();
side_bar();
translate([0, frame_bar_width, 0])
    rotate([0, 0, 180])
        side_bar();
translate([-frame_width/2, frame_bar_width/2+foundation_sheet_thickness(backbone=1, draw=draw)/2, 0])
    rotate([90, 0, 0])
        foundation_sheet(frame_width, frame_height, backbone=1, draw=draw);