xy_array = [[0,0],[100,100],[200,100]];
function calc_rotation(a,b) = (
    let (x0=a[0])
    let (x1=b[0])
    let (y0=a[1])
    let (y1=b[1])
    let (xdiff=x1-x0)
    let (ydiff=y1-y0)
    let (rot=atan2(xdiff,ydiff))
    rot
);

function calc_distance(a,b) = (
    let (x0=a[0])
    let (x1=b[0])
    let (y0=a[1])
    let (y1=b[1])
    let (xpow=pow(x1-x0,2))
    let (ypow=pow(y1-y0,2))
    let (r=sqrt(xpow+ypow))
    r
);

for (i = [0:(len(xy_array)-1)]){
    if(i<len(xy_array)-1)
        echo(rot=calc_rotation(xy_array[i],b=xy_array[i+1]));
}

for (i = [0:(len(xy_array)-1)]){
    if(i<len(xy_array)-1)
        echo(dist=calc_distance(xy_array[i],b=xy_array[i+1]));
}
   
    