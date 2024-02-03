// Plank Dimensions
PLANK_LENGTH = 1000;
PLANK_DEPTH = 300;
PLANK_THICKNESS = 18;

// Backpanel Dimensions
DEPTH_BACKPANEL = 20;
COLOR_BACKPANEL = [0.5, 0.2, 0.3, 1];

// Frontpanel Dimensions
HEIGHT_FRONTPANEL = 200;
WIDTH_FRONTPANEL = PLANK_LENGTH - (PLANK_THICKNESS*2);
DEPTH_FRONTPANEL = PLANK_THICKNESS;

// BoundingBox Dimensions
HEIGHT_BBOX = PLANK_LENGTH + PLANK_THICKNESS;
WIDTH_BBOX = PLANK_LENGTH;
DEPTH_BBOX = PLANK_DEPTH;


BBOX_MIDDLE = HEIGHT_BBOX * 0.5 - PLANK_THICKNESS * 0.5;
BBOX_TOP = HEIGHT_BBOX - PLANK_THICKNESS;


module BoundingBox(){
    color("blue", 0.2)
        cube([WIDTH_BBOX, DEPTH_BBOX, HEIGHT_BBOX]);
}

module BackPanel(){
    color(COLOR_BACKPANEL)
        cube([WIDTH_BBOX, DEPTH_BACKPANEL, HEIGHT_BBOX]);
}

module Plank(){
    cube([PLANK_LENGTH - (PLANK_LENGTH - WIDTH_BBOX), DEPTH_BBOX - DEPTH_BACKPANEL, PLANK_THICKNESS]);
}

// Plank - Top
module PlankTop(){
    translate([0,0,HEIGHT_BBOX - PLANK_THICKNESS]){
        Plank();
    }
}

// Plank - Side
module PlankSide(){
    translate([0, 0, 0]){
        cube([PLANK_THICKNESS, DEPTH_BBOX - DEPTH_BACKPANEL, PLANK_LENGTH]);
    }
}

// Plank - FrontPanel
module PlankFrontPanel(){
    translate([PLANK_THICKNESS, PLANK_DEPTH - PLANK_THICKNESS - DEPTH_BACKPANEL, 0]){
        color("green")
            cube([WIDTH_BBOX - PLANK_THICKNESS * 2, PLANK_THICKNESS, HEIGHT_FRONTPANEL]);
    }
}

// BoundingBox();
module BasicCabinet(){
    BackPanel();
    translate([0, DEPTH_BACKPANEL, 0]){
        PlankTop();
        PlankSide();
        translate([WIDTH_BBOX - PLANK_THICKNESS, 0, 0]){
            PlankSide();
        }
        PlankFrontPanel();
        translate([0, 0, BBOX_TOP - HEIGHT_FRONTPANEL]){
            PlankFrontPanel();
        }
    }
}
BasicCabinet();

BackPanel();

points = [[0,0,0], [0, 0, HEIGHT_BBOX], [WIDTH_BBOX, 0, HEIGHT_BBOX - (PLANK_THICKNESS * 0.5)], [WIDTH_BBOX, 0, 0]];
echo(points);

module Nail(coords){
    let (x=coords[0])
    let (y=coords[1])
    let (z=coords[2])
    translate(coords){
        color("red")
            cylinder(r=2, h=PLANK_THICKNESS);
    }
}

module NailsOnFrame(xyz_list){
    for (xyz = xyz_list){
        Nail(xyz);
    }
}

//NailsOnFrame(points);