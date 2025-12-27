module cell_punch(cell_size=5.4, h=30) {
    x = cell_size / 2;
    r = x / sin(60);
    e1 = r * sqrt(2) / 4;
    e2 = 2 * e1;
    polyhedron([[0, 0, 0], [0, r, e1], [x, r/2, e2], [x, -r/2, e1], [0, -r, e2], [-x, -r/2, e1], [-x, r/2, e2], [0, r, h], [x, r/2, h], [x, -r/2, h], [0, -r, h], [-x, -r/2, h], [-x, r/2, h]], faces=[[0, 3, 2, 1], [0, 5, 4, 3], [0, 1, 6, 5], [1, 2, 8, 7], [2, 3, 9, 8], [3, 4, 10, 9], [4, 5, 11, 10], [5, 6, 12, 11], [6, 1, 7, 12], [7, 8, 9, 10, 11, 12]]);
}

module cell_positive(cell_size=5.4, h=2) {
    x = cell_size / 2;
    r = x / sin(60);
    e1 = r * sqrt(2) / 4;
    e2 = 2 * e1;
    polyhedron([[0, 0, 0], [0, r, e1], [x, r/2, e2], [x, -r/2, e1], [0, -r, e2], [-x, -r/2, e1], [-x, r/2, e2], [0, r, e1+h], [x, r/2, e2+h], [x, -r/2, e1+h], [0, -r, e2+h], [-x, -r/2, e1+h], [-x, r/2, e2+h], [0, 0, h]], faces=[[0, 3, 2, 1], [0, 5, 4, 3], [0, 1, 6, 5], [1, 2, 8, 7], [2, 3, 9, 8], [3, 4, 10, 9], [4, 5, 11, 10], [5, 6, 12, 11], [6, 1, 7, 12], [13, 7, 8, 9], [13, 9, 10, 11], [13, 11, 12, 7]]);
}

module comb_impression(w, v, cell_size, gap, pa=0, draw=0) {
    r = cell_size / 2 / sin(60);
    ymax = ceil(v / (r * 3/2)) + 1;
    xmax = ceil(w / cell_size);
    
    yopt = floor(ymax / 8);
    xopt = floor(xmax / 8);
    
    for (y = [0 : 1 : ymax]) {
        offset = y % 2 == 1 ? cell_size / 2 : 0;
        translate([offset, y * (r * 3/2), 0]) {
            for (x = [0 : 1 : xmax]) {
                translate([x * cell_size, 0, 0]) {
                    rotate([0, 0, pa])
                        cell_punch(cell_size=cell_size-gap, h=draw+30);
                }
            }
        }
    }
}

function foundation_sheet_thickness(cell_size=5.4, backbone=1, draw=0) = (cell_size / 2 / sin(60)) * sqrt(2) / 2 + backbone + draw * 2;

module foundation_sheet(w, v, cell_size=5.4, backbone=1, gap=0.2, draw=0) {
    x = cell_size / 2;
    r = x / sin(60);
    e1 = r * sqrt(2) / 4;
    e2 = 2 * e1;
    
    difference() {
        translate([0, 0, 0])
            cube([w, v, e2+backbone+draw*2]);
        translate([0, 0, backbone+draw])
            comb_impression(w, v, cell_size, gap, draw=draw);
        translate([-x, x/2, e2+draw])
            mirror([0, 0, 1])
                comb_impression(w+x, v, cell_size, gap, draw=draw, pa=180);
    }
}

foundation_sheet(100, 100, backbone=1);