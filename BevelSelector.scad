//    BevelSelector -- Mechanical Direction Selector for TearDrop Propeller
//    Based on "Gentle Propulsion" by Robert L. Read (PubInv)
//    Modifications by Rayan (2025-2026)
//    Licensed under AGPL v3
//
//    SYSTEM OVERVIEW:
//    - 1x central bevel gear on DC motor shaft (spins always)
//    - 4x output bevel gears, one per hemisphere, at 90° intervals
//    - 1x selector ring that slides along each output shaft to engage/disengage
//    - 1x servo rotates a cam that pushes the selector ring into mesh
//    - Press button → Arduino signals servo → ring engages → hemisphere spins
//
//    PRINT SETTINGS:
//    - Material : PLA or PETG
//    - Infill   : 40% for gears, 20% for housing
//    - Supports : None needed if printed in correct orientation
//    - Layer h  : 0.2mm for gears, 0.3mm ok for housing

// ─────────────── PARAMETERS ───────────────

// Bevel gear shared params
gear_module     = 2;       // gear tooth size (mm) — bigger = stronger
pressure_angle  = 20;      // standard pressure angle (degrees)
bevel_angle     = 45;      // bevel pitch angle — 45° for 1:1 ratio
num_teeth_drive = 16;      // teeth on central drive gear
num_teeth_out   = 16;      // teeth on output gears (1:1 ratio, change for speed reduction)

// Gear geometry (derived)
pitch_r_drive   = gear_module * num_teeth_drive / 2;  // = 16mm
pitch_r_out     = gear_module * num_teeth_out   / 2;  // = 16mm
gear_height     = 10;      // face width of bevel gear

// Motor shaft
motor_shaft_r   = 1.5;    // 6V DC motor shaft = 2mm diameter → r = 1mm + clearance
motor_shaft_flat= 0.4;    // flat on D-shaft if applicable

// Output shafts (connect to hemisphere hubs)
out_shaft_r     = 3;       // output shaft radius (printable axle)
out_shaft_len   = 40;      // length of each output shaft arm
bearing_wall    = 2.5;     // wall thickness around shaft bore

// Selector ring (slides along output shaft to engage gear)
ring_inner_r    = out_shaft_r + 0.3;   // slip fit over shaft
ring_outer_r    = out_shaft_r + 6;     // outer radius of ring
ring_h          = 8;                    // height of ring
ring_tooth_h    = 3;                    // engagement tooth height
ring_travel     = 5;                    // how far ring slides to engage

// Selector cam (servo-driven, pushes ring)
cam_r           = 12;      // cam radius
cam_lift        = ring_travel + 1;  // cam lift = ring travel + margin
cam_shaft_r     = 1.5;    // servo horn shaft
servo_arm_len   = 18;      // servo horn arm length

// Housing
housing_r       = pitch_r_drive + 20;  // overall housing radius
housing_h       = 60;                   // total height of housing
housing_wall    = 3;                    // wall thickness
mount_hole_r    = 2;                    // M4 mounting holes

// Arduino button mount
button_w        = 12;
button_h        = 6;

$fn = 48;

// ─────────────── BEVEL GEAR APPROXIMATION ───────────────
// OpenSCAD doesn't have native bevel gears — we approximate
// with a truncated cone with trapezoidal teeth cut around it.
// For real printing use the MCAD library or parametric gear generator.
// This gives the correct geometry for assembly visualization.

module bevel_gear_blank(pitch_r, height, angle) {
    // Frustum approximating bevel gear body
    top_r = pitch_r * 0.4;
    cylinder(h = height, r1 = pitch_r, r2 = top_r);
}

module tooth_cutter(pitch_r, num_teeth, height) {
    tooth_w = (2 * PI * pitch_r / num_teeth) * 0.4;
    for (i = [0 : num_teeth - 1]) {
        angle = i * 360 / num_teeth;
        rotate([0, 0, angle])
        translate([pitch_r, 0, height * 0.3])
        rotate([10, 0, 0])
        cube([tooth_w, tooth_w * 0.8, height * 0.8], center = true);
    }
}

module bevel_gear(pitch_r, num_teeth, height) {
    difference() {
        bevel_gear_blank(pitch_r, height, bevel_angle);
        tooth_cutter(pitch_r, num_teeth, height);
    }
}

// ─────────────── MOTOR SHAFT HOLE ───────────────
module motor_shaft_hole() {
    difference() {
        cylinder(r = motor_shaft_r, h = gear_height + 2, center = true);
        // flat cut for grip
        translate([motor_shaft_r - motor_shaft_flat, 0, 0])
            cube([motor_shaft_flat * 2, motor_shaft_r * 2 + 1,
                  gear_height + 3], center = true);
    }
}

// ─────────────── DRIVE GEAR (on motor shaft, spins always) ───────────────
module drive_gear() {
    difference() {
        bevel_gear(pitch_r_drive, num_teeth_drive, gear_height);
        motor_shaft_hole();
    }
}

// ─────────────── OUTPUT SHAFT ───────────────
module output_shaft() {
    cylinder(r = out_shaft_r, h = out_shaft_len);
}

// ─────────────── OUTPUT BEVEL GEAR (one per hemisphere) ───────────────
module output_gear() {
    difference() {
        rotate([90, 0, 0])  // orient to mesh with drive gear
            bevel_gear(pitch_r_out, num_teeth_out, gear_height);
        // shaft bore through center
        rotate([90, 0, 0])
            cylinder(r = out_shaft_r + 0.2, h = gear_height + 2, center = true);
    }
}

// ─────────────── SELECTOR RING (slides on output shaft) ───────────────
// Slides outward to disengage, inward to mesh with output gear face
module selector_ring() {
    difference() {
        union() {
            // main ring body
            cylinder(r = ring_outer_r, h = ring_h);
            // engagement teeth on inner face
            for (i = [0 : 5]) {
                angle = i * 60;
                rotate([0, 0, angle])
                translate([ring_inner_r + 1, 0, 0])
                    cube([ring_tooth_h, 2, ring_h], center = false);
            }
            // cam follower tab (servo cam pushes this)
            translate([ring_outer_r - 1, 0, ring_h / 2])
                cube([4, 6, 4], center = true);
        }
        // shaft bore
        cylinder(r = ring_inner_r, h = ring_h + 1);
    }
}

// ─────────────── SERVO CAM (rotates to push selector ring) ───────────────
module servo_cam() {
    difference() {
        union() {
            // cam disc — eccentric so rotation = linear push on ring
            cylinder(r = cam_r, h = 6);
            // lift lobe
            translate([cam_r * 0.4, 0, 0])
                cylinder(r = cam_r * 0.5, h = 6 + cam_lift);
            // servo arm
            translate([0, 0, 3])
                rotate([0, 90, 0])
                    cylinder(r = 2, h = servo_arm_len);
        }
        // servo shaft hole
        cylinder(r = cam_shaft_r, h = 10, center = true);
    }
}

// ─────────────── SERVO BRACKET (mounts servo to housing) ───────────────
module servo_bracket() {
    // Simple U-bracket that clips around standard 9g servo body (23x12x29mm)
    difference() {
        cube([30, 16, 35]);
        // servo body cutout
        translate([3, 2, 5])
            cube([24, 12, 30]);
        // screw holes
        translate([15, 8, 1])
            cylinder(r = 1.5, h = 5);
        translate([15, 8, 30])
            cylinder(r = 1.5, h = 5);
    }
}

// ─────────────── HOUSING (cylindrical, holds everything) ───────────────
module housing() {
    difference() {
        // outer shell
        cylinder(r = housing_r, h = housing_h);
        // hollow inside
        translate([0, 0, housing_wall])
            cylinder(r = housing_r - housing_wall, h = housing_h);
        // 4 output shaft ports at 90° intervals (sides)
        for (i = [0 : 3]) {
            rotate([0, 0, i * 90])
            translate([housing_r - housing_wall - 1, 0, housing_h / 2])
            rotate([0, 90, 0])
                cylinder(r = out_shaft_r + 1, h = housing_wall + 2);
        }
        // motor shaft port (bottom center)
        cylinder(r = motor_shaft_r + 1, h = housing_wall + 1);
        // servo port (side cutout)
        translate([housing_r - housing_wall - 1, -8, housing_h * 0.6])
            cube([housing_wall + 2, 16, 20]);
        // M4 mounting holes (base)
        for (i = [0 : 3]) {
            rotate([0, 0, 45 + i * 90])
            translate([housing_r - 8, 0, 0])
                cylinder(r = mount_hole_r, h = housing_wall + 1);
        }
    }
}

// ─────────────── BUTTON MOUNT (4 buttons on housing exterior) ───────────────
module button_mount() {
    difference() {
        cube([button_w + 6, button_w + 6, button_h + 4]);
        translate([3, 3, 2])
            cube([button_w, button_w, button_h + 3]);
        // button hole
        translate([button_w / 2 + 3, button_w / 2 + 3, 0])
            cylinder(r = 3, h = 3);
    }
}

// ─────────────── FULL ASSEMBLY (exploded for visibility) ───────────────
module full_assembly() {
    // Housing
    color("LightGray", 0.4)
        housing();

    // Drive gear on motor shaft (center bottom)
    color("SteelBlue")
    translate([0, 0, housing_wall + 2])
        drive_gear();

    // 4 output gears + shafts + selector rings at 90° intervals
    for (i = [0 : 3]) {
        rotate([0, 0, i * 90]) {
            // output gear meshing with drive gear
            color("Coral")
            translate([pitch_r_drive + pitch_r_out * 0.5,
                       0, housing_wall + gear_height / 2])
                output_gear();

            // output shaft extending outward
            color("Gray")
            translate([pitch_r_drive + pitch_r_out,
                       0, housing_wall + gear_height / 2])
            rotate([0, 90, 0])
                output_shaft();

            // selector ring on shaft (disengaged position shown)
            color("Orange")
            translate([pitch_r_drive + pitch_r_out + ring_travel + 4,
                       0, housing_wall + gear_height / 2 - ring_h / 2])
            rotate([0, 90, 0])
                selector_ring();
        }
    }

    // Servo cam (one side)
    color("Green")
    translate([housing_r - 5, 0, housing_h * 0.65])
        servo_cam();

    // Servo bracket
    color("DarkGray", 0.6)
    translate([housing_r + 2, -8, housing_h * 0.55])
        servo_bracket();
}

// ─────────────── RENDER OPTIONS ───────────────
// Uncomment ONE at a time to print individual parts:

full_assembly();       // full view — render this first to check fit

// drive_gear();       // print 1x — goes on motor shaft
// output_gear();      // print 4x — one per hemisphere direction
// selector_ring();    // print 4x — one per output shaft
// servo_cam();        // print 1x — attaches to servo horn
// servo_bracket();    // print 1x — holds servo to housing
// housing();          // print 1x — outer shell
// button_mount();     // print 4x — one per direction button

// ─────────────── WIRING NOTES ───────────────
// 6V DC motor  → always on when powered
// Servo signal → Arduino digital pin (one servo, rotates to 4 positions)
// 4 buttons    → Arduino digital pins 2,3,4,5 (one per direction)
// Arduino code → button pressed → servo.write(angle) → ring engages
//
// Servo angles for each direction (calibrate after printing):
//   Forward  (hemisphere 0°)  : servo ~0°
//   Right    (hemisphere 90°) : servo ~90°
//   Backward (hemisphere 180°): servo ~180°
//   Left     (hemisphere 270°): servo ~270° (or -90°)
//
// Parts to BUY (everything else prints):
//   1x 6V DC motor         ~$3
//   1x SG90 9g servo       ~$3
//   1x Arduino Nano        ~$5
//   4x momentary buttons   ~$1
//   1x 4xAA battery pack   ~$2
//   Screws: M3x10 x8       ~$1
//   TOTAL                  ~$15
