
function calc_rotation(a,b) = (
    let (x0=a[0])
    let (y0=a[1])
    let (x1=b[0])
    let (y1=b[1])
    let (xdiff=x1-x0)
    let (ydiff=y1-y0)
    let (rot=atan2(abs(xdiff),abs(ydiff)))
    rot
);

function calc_distance(a,b) = (
    let (x0=a[0])
    let (x1=b[0])
    let (y0=a[1])
    let (y1=b[1])
    let (xpow=pow(abs(x1-x0),2))
    let (ypow=pow(abs(y1-y0),2))
    let (r=sqrt(xpow+ypow))
    r
);

function calc_absolute_offset(a,b) = (
    let (x0=a[0])
    let (x1=b[0])
    let (y0=a[1])
    let (y1=b[1])
    let (xoffset=abs(x1-x0))
    let (yoffset=abs(y1-y0))
    let (offset=[xoffset,yoffset])
    offset
);


module pillar(){
    cylinder(r=10,h=100);
}

// Plank at origin
module Plank(h=0){
    cube([100,10,10]);
}

module Wall(r=0, h=0){
    rotate([0,0,r])
    pillar();
    rotate([0,0,r])
    Plank();
}

xy_array = [[0,0],[100,100],[200,100],[300,0],[320,230]];
plen = len(xy_array);

module PlaceWall(a,b){
    let (offset=calc_absolute_offset(a,b))
    let (rot=calc_rotation(a,offset))
    let (dist=calc_distance(a,b))
    echo (o = offset, d = dist, r = rot)
    translate(a)
    Wall(rot, 2);
}

PlaceWall(a = xy_array[0], b = xy_array[1]);
PlaceWall(a = xy_array[1], b = xy_array[2]);
PlaceWall(a = xy_array[2], b = xy_array[3]);
PlaceWall(a = xy_array[3], b = xy_array[4]);

