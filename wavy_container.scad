
// ==========================================================
// Wavy Shipping Container Model
// Base: 26 x 13.5 mm, Height: 15 mm
// Flat bottom for 3D printing, wavy (corrugated) side walls
// ==========================================================

// ---- Parameters ----
length      = 25.5;
width       = 12.8;
height      = 15;
wall_margin = 1;
wall_indent = 1;

length_bars = 11;
width_bars = 6;


$fn = 100;

module cube_on_z0 (width, length, height) {
    translate(v = [0,0,height/2]) {
        cube([width
             ,length
             ,height]
            ,center=true);
    }
}

union() {
    difference() {
        cube_on_z0(width, length, height);

        translate([0,length/2,wall_margin]){
            cube_on_z0(width-2*wall_margin, 2*wall_indent, height-2*wall_margin);
        }
        translate([0,-length/2,wall_margin]){
            cube_on_z0(width-2*wall_margin, 2*wall_indent, height-2*wall_margin);
        }
        translate([width/2,0,wall_margin]){
            cube_on_z0(2*wall_indent, length-2*wall_margin, height-2*wall_margin);
        }
        translate([-width/2,0,wall_margin]){
            cube_on_z0(2*wall_indent, length-2*wall_margin, height-2*wall_margin);
        }
        translate([0,0,height-wall_indent]){
            cube_on_z0(width-2*wall_margin, length-2*wall_margin, 2*wall_indent);
        }
    }
    for (i=[0:length_bars]) {
        translate([width/2 - wall_indent/2, -length/2 + wall_margin + (length-2*wall_margin)*i/length_bars,0]) {
            cube_on_z0(wall_indent, wall_indent, height);
        }
        translate([-width/2 + wall_indent/2, -length/2 + wall_margin + (length-2*wall_margin)*i/length_bars,0]) {
            cube_on_z0(wall_indent, wall_indent, height);
        }
        translate([0, -length/2 + wall_margin + (length-2*wall_margin)*i/length_bars, height-wall_indent]) {
            cube_on_z0(width, wall_indent, wall_indent);
        }
    }
    for (i=[0:width_bars]) {
        translate([-width/2 + wall_margin + (width-2*wall_margin)*i/width_bars, length/2 - wall_indent/2 ,0]) {
            cube_on_z0(wall_indent, wall_indent, height);
        }
        translate([-width/2 + wall_margin + (width-2*wall_margin)*i/width_bars, -length/2 + wall_indent/2 ,0]) {
            cube_on_z0(wall_indent, wall_indent, height);
        }
    }
    
}


