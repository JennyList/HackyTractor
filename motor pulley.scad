include <pulleys.scad>

// Convert mm to inches for pulley library
function toinches(mm) = mm * 0.0393701; 

//Basic pulley dimensions
pulleyDia = 65; //mm
shaftDia = 17.02; //mm

//Dimensions of add-on to fit alternator
socketInsetRadius = 17.5; //radius of opening into which nut goes over shaft
socketInsertCylinderLength = 8; //Length of cylinder to fill socket insert hole
socketInsertDepthAboveHalfWay = 1.5; //offset of socket insert below half way down the pulley
protrudingBossRadius = 12.5; //radius of central boss that protrudes to meet flat on motor shaft
bossCylinderLength = 4.5; //length from face for washer to protruding face

//Pulley uses inches
pulley("A", toinches(pulleyDia), toinches(socketInsetRadius*2), 0);

//   Make adaptor to fit motor
//carve out socket insert size hole already done by making pulley shaft
//put in socket insert sized cylinder
translate([0,0,socketInsertDepthAboveHalfWay])
difference() {
	cylinder(h=socketInsertCylinderLength, r=socketInsetRadius);
	cylinder(h=socketInsertCylinderLength, r=shaftDia/2);
}

//add cylinder to form the protruding boss
translate([0,0,socketInsertDepthAboveHalfWay+socketInsertCylinderLength])
difference() {
	cylinder(h=bossCylinderLength, r=protrudingBossRadius);
	cylinder(h=bossCylinderLength, r=shaftDia/2);
}






