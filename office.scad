DESK_DIMENSIONS = [200, 100, 100];
DESKS_PER_ROW = [2, 2, 2, 3];

// Module desk block and empty space
module createDeskBlock(dimensions) {
    module desk() {
        cube(dimensions);
    }

    module emptySpace() {
        translate([0, dimensions[1], 0])
            color("orchid", 0.5)
                desk();
    }

    desk();
    emptySpace();
}


module createDeskRow(dimensions, numDesks) {
    for (i = [0 : numDesks - 1]) {
        translate([i * dimensions[0], 0, 0])
            createDeskBlock(dimensions);
    }
}

module createOppositeDeskLayout(numDesks, numDesksOpposite) {
    let (yOffset = (2 * DESK_DIMENSIONS[1])) {
        translate([0, yOffset, 0]) {
            createDeskRow(dimensions = DESK_DIMENSIONS, numDesks = numDesks);
            let (xOffset = (numDesksOpposite * DESK_DIMENSIONS[0])) {
                translate([xOffset, 0, 0])
                    rotate([0, 0, 180])
                        createDeskRow(dimensions = DESK_DIMENSIONS, numDesks = numDesksOpposite);
            }
        }
    }
}

module OfficeDesks() {
    let (nrRows = len(DESKS_PER_ROW))
    for (i = [0 : nrRows - 1]) {
        let (yOffset = (4 * DESK_DIMENSIONS[1])) {
            translate([0, yOffset * i, 0])
                createOppositeDeskLayout(DESKS_PER_ROW[i], DESKS_PER_ROW[i]);
        }
    }
}

OfficeDesks();
