//    GentlePropulsion + Motor Mount
//    Original design by Robert L. Read (PubInv), 2022
//    https://github.com/PubInv/unscrew-propeller
//    Licensed under AGPL v3 / CERN OHL-S v2
//
//    Motor mount addition by Rayan, 2026
//    Permission granted by Robert L. Read
//
//    WHAT'S NEW vs. ORIGINAL:
//    - motor_mount() module: a hub that fits inside the rotor base
//      and grips a standard 6V DC motor shaft (2mm)
//    - motor_bracket() module: a clip that holds the motor body
//      inside the tail cone
//    - top() and bottom() are UNCHANGED from Robert's original
//    - Print top + bottom from original STLs, print mount separately

// ─────────────── ORIGINAL PARAMETERS (unchanged) ───────────────
shell_r         = 50;
tail_cone_slip  = 15;
shell_thickness = 4;
fraction        = 1/2;
portal_width    = 25.4;
tail_factor     = 3;
num_lobes       = 4;
$fn             = 20;

// ─────────────── MOTOR MOUNT PARAMETERS ───────────────
motor_shaft_d   = 2.0;   // 6V DC hobby motor shaft diameter (mm)
                          // measure yours — common sizes: 2mm, 2.3mm, 3mm
shaft_flat      = 0.5;   // D-flat depth (set 0 if motor shaft is round)
mount_hub_r     = 10;    // hub radius — fits inside portal_width/2
mount_hub_h     = 14;    // hub height
mount_wall      = 3;     // wall thickness around shaft
motor_body_d    = 24;    // diameter of your 6V DC motor body (measure yours)
motor_body_l    = 20;    // length of motor body
bracket_wall    = 2.5;   // bracket wall thickness
clip_gap        = 0.4;   // gap for clip flex

// ─────────────── ORIGINAL MODULES (Robert Read, unchanged) ───────────────

module shell (r = shell_r, thickness = shell_thickness) {
    difference() {
        sphere(r);
        sphere(r - thickness);
        color("red");
        translate([0,0,-r])
        cube(size = [2*r,2*r,2*r],center = true);
    }
}

module lobeknife(num_lobes,r) {
    r = shell_r;
    lr = r/2;
    for( i = [0: num_lobes -1]) {
        angle = ( i * 360 / num_lobes);
        rotate([0,0,angle])
        translate([lr,0,lr])
        rotate([0,45,0])
        sphere(lr);
    }    
}

module lobes(num_lobes,r) {
    r = shell_r;
    lr = r/2;
    for( i = [0: num_lobes -1]) {
        angle = ( i * 360 / num_lobes);
        rotate([0,0,angle])
        translate([lr,0,lr])
        rotate([0,45,0])
        shell(lr,shell_thickness);
    }       
}

module cut_lobes(num_lobes,r) {
    difference() {
        lobes(num_lobes,r);
        sphere(r-shell_thickness);
    }
}

module square_knife() {
    cube([portal_width,portal_width,shell_r],center = true);
}

module rotor() {
    r = shell_r;
    lr = r/2;
    difference() {
        union() {
            difference() {
                shell(shell_r,shell_thickness);
                lobeknife(num_lobes);  
            }
        cut_lobes(num_lobes,r);
        }
        square_knife();
    }
    linear_extrude(2,center=true)
    circle(r);
}

module tail_cone() {
    l = tail_factor * shell_r;
    translate([0,0,-l/2])
    rotate([180,0,0])
    cylinder(l,shell_r,center = true);
}

module tail() {
    union() {
        difference() {
            tail_cone();
            translate([0,0,tail_cone_slip])
            tail_cone();
        }
        linear_extrude(2,center=true)
        circle(shell_r);
    }
}

module top() {
    difference() {
        union() {
            rotor();
        }
        square_knife();
    }   
}

module bottom() {
    difference() {
        union() {
            tail();
        }
        square_knife();
        scale([1,1,10])
        square_knife();
    }   
}

// ─────────────── MOTOR MOUNT HUB (NEW) ───────────────
// Prints separately. Press-fits into the square portal of top().
// Grips motor shaft so rotor spins with motor.
//
// portal_width = 25.4mm — hub must fit inside this
// Hub is square-ish to resist rotation inside portal

module motor_mount() {
    shaft_r = motor_shaft_d / 2;
    difference() {
        union() {
            // square hub body that keys into portal_width slot
            cube([portal_width - 0.6,
                  portal_width - 0.6,
                  mount_hub_h], center = true);
            // round collar above for strength
            cylinder(r = mount_hub_r, h = mount_hub_h, center = true);
        }
        // motor shaft hole through center
        union() {
            cylinder(r = shaft_r + 0.1,
                     h = mount_hub_h + 2, center = true);
            // D-flat cut (set shaft_flat=0 for round shaft)
            if (shaft_flat > 0)
                translate([shaft_r - shaft_flat + 0.1, 0, 0])
                    cube([shaft_flat * 2,
                          motor_shaft_d + 1,
                          mount_hub_h + 3], center = true);
        }
    }
}

// ─────────────── MOTOR BRACKET (NEW) ───────────────
// Sits inside tail cone, cradles the 6V DC motor body.
// 3 arms press against inner wall of tail cone.
// Motor body slides in from the open base.

module motor_bracket() {
    motor_r = motor_body_d / 2;
    arm_len = shell_r - motor_r - bracket_wall - 4;

    difference() {
        union() {
            // collar around motor body
            difference() {
                cylinder(r = motor_r + bracket_wall,
                         h = motor_body_l * 0.6);
                // motor body bore
                cylinder(r = motor_r + 0.3,
                         h = motor_body_l + 1);
                // clip gap so it snaps onto motor
                translate([0, -clip_gap / 2, 0])
                    cube([motor_r * 2 + bracket_wall * 2 + 1,
                          clip_gap,
                          motor_body_l + 1]);
            }
            // 3 mounting arms to tail cone inner wall
            for (i = [0 : 2]) {
                rotate([0, 0, i * 120])
                translate([motor_r + bracket_wall, 0, 0])
                    cube([arm_len, 3, motor_body_l * 0.4]);
            }
        }
        // shaft clearance hole through top of collar
        cylinder(r = motor_shaft_d / 2 + 1,
                 h = motor_body_l + 2);
    }
}

// ─────────────── RENDER ───────────────
// Uncomment ONE section at a time:

// -- OPTION A: view full assembly (for reference only, not for printing) --
color("LightBlue",  0.5) top();
color("LightGreen", 0.5) bottom();
color("Orange")          translate([0,0,3]) motor_mount();
color("Coral")           translate([0,0,-40]) motor_bracket();

// -- OPTION B: print motor_mount only (fits inside top() portal) --
// motor_mount();

// -- OPTION C: print motor_bracket only (sits inside bottom() tail) --
// motor_bracket();

// -- OPTION D: print Robert's original top (unchanged) --
// top();

// -- OPTION E: print Robert's original bottom (unchanged) --
// bottom();

// ─────────────── ASSEMBLY INSTRUCTIONS ───────────────
//
// 1. Print top() and bottom() — or use Robert's STLs from GitHub
//    GentlePropulsionTop.stl + GentlePropulsionTail.stl
//
// 2. Print motor_mount() — takes ~20min in PLA
//    Print flat face down, no supports needed
//
// 3. Print motor_bracket() — takes ~30min in PLA
//    Print with 3 arms face down
//
// 4. Assembly:
//    a. Press motor_bracket into tail cone — arms grip inner wall
//    b. Slide 6V DC motor into bracket from the open base
//    c. Feed motor shaft up through the portal hole
//    d. Press motor_mount onto shaft (and into portal square slot)
//    e. Place top() rotor over mount — square hub keys into portal
//    f. The rotor is now keyed to the motor shaft — it spins with it!
//
// 5. Wiring:
//    Motor + wire → battery +
//    Motor - wire → switch → battery -
//    Flip switch polarity to reverse (DPDT switch = $1)
//
// 6. Test:
//    Hold tail cone, spin motor, watch rotor turn
//    Then test in water — point rotor side forward
//
// MOTOR SIZING NOTE:
//    motor_body_d = 24mm is typical for cheap 6V 130-size motors
//    Measure your actual motor and update motor_body_d before printing!
//    Common 6V motor body diameters: 20mm, 24mm, 27mm, 33mm
