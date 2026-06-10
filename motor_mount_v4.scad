// motor_mount_v4.scad
// Motor mount for standard 130-size 6V DC motor (20mm body diameter)
// Designed by Rayan, 2026
// Built on Gentle Propulsion by Robert L. Read (PubInv)
// Licensed under AGPL v3
//
// Collar diameter: 24mm — fits through 25.4mm square portal
// Square block: 4mm tall — leaves enough shaft exposed to bond to rotor
// Shaft hole: 2mm diameter through entire part

$fn=64;

motor_r  = 10;      // 130-size motor body radius (20mm diameter / 2)
shaft_r  = 1.1;     // 2mm shaft + small clearance
wall     = 2;       // wall thickness — keeps collar under 25.4mm portal
portal_w = 25.4;    // square portal width (matches rotor and tail cone)
collar_h = 12;      // height of collar gripping motor body
block_h  = 4;       // square block height — thin so shaft reaches through

difference() {
    union() {
        // round collar — grips motor body, fits through portal
        cylinder(r = motor_r + wall, h = collar_h);
        // square block on top — keys into rotor portal hole, stops rotation
        translate([0, 0, collar_h])
            cube([portal_w - 0.6, portal_w - 0.6, block_h], center = true);
    }
    // motor body bore
    translate([0, 0, -1])
        cylinder(r = motor_r + 0.4, h = collar_h + 1);
    // shaft hole all the way through
    translate([0, 0, -1])
        cylinder(r = shaft_r, h = collar_h + block_h + 2);
}

// Assembly notes:
// 1. Slide motor into collar from below, shaft pointing up
// 2. Push square block up into rotor portal hole from underneath
// 3. Hot glue around square block edges to bond to rotor
// 4. Super glue shaft tip inside portal hole to transfer spin
// 5. Hot glue collar against cone inner wall to stop motor rotating
