// CABINET BBOX
CABINET_X = 1000;
CABINET_Y = 300;
CABINET_Z = 1000;

PLANK_Z = 18;
PLANK_Y = 300;

SIDEPLANK_Y = 300;
SIDEPLANK_X = 18;
SIDEPLANK_Z = 1000;

BACKBOARD_X = 1000;
BACKBOARD_Y = 10;
BACKBOARD_Z = 1000;



linear_extrude(BACKBOARD_Z, center=false, convexity = 1, slices = 1, scale =1.0){    
    square([BACKBOARD_X, BACKBOARD_Y],      center= true);
}
     
linear_extrude(PLANK_Z, center=false, convexity = 1, slices = 1, scale =1.0){    
    square([CABINET_X, CABINET_Y], center = true);    
}

linear_extrude(SIDEPLANK_Z, center=false, convexity = 1, slices = 1, scale =1.0){    
    square([SIDEPLANK_X, SIDEPLANK_Y],      center= true);
}
