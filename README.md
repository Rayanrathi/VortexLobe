# VortexLobe
An open-source unscrew propeller project built on the "Gentle Propulsion" design by Robert L. Read of Public Invention. This project explores hemispherical lobe propulsion as an alternative to traditional flat-blade propellers — tested in both water and air.


Built with permission from Robert L. Read.
This project is a direct extension of his original open-source research.




What is VortexLobe?

Traditional propellers use flat angled blades to push fluid backward and generate thrust. VortexLobe instead uses four curved hemispherical lobes attached to a spherical rotor. When the rotor spins, the lobes interact with the surrounding fluid in a rotational "unscrewing" motion, generating forward thrust.

This design is potentially safer for aquatic life than traditional propellers — the curved geometry reduces the risk of injury to organisms that come into contact with the spinning rotor.

This project tests:


Whether the unscrew propeller generates measurable thrust in water
Whether the same design generates thrust in air
How thrust changes at different voltages (3V, 4.5V, 6V)
How efficiency compares to a traditional propeller



Original Design Credit

This project is based entirely on the Gentle Propulsion project by Robert L. Read:


Original repo: https://github.com/PubInv/unscrew-propeller
Original author: Robert L. Read, Public Invention
Original license: AGPL v3 / CERN OHL-S v2


Robert L. Read generously gave permission for this project to build on his work and present findings independently at a science fair competition. Thank you!


What's New in VortexLobe

FeatureOriginal (Gentle Propulsion)VortexLobeRotor designHemisphere with 4 lobesSame (unchanged)Tail coneTapered coneSame (unchanged)Motor mountNone (drill + wooden shaft)3D printed motor mountPowerManual drill6V DC motorDirection controlOne directionForward + reverse (swap wires)


Files

VortexLobe/
├── STL/
│   ├── GentlePropulsionTop.stl       # Main rotor with 4 lobes (print 1x)
│   ├── GentlePropulsionTail.stl      # Tail cone housing (print 1x)
│   └── motor_mount_v4.stl            # Motor mount hub (print 1x)
├── SCAD/
│   ├── GentlePropulsion_MotorMount.scad  # Full OpenSCAD source
│   └── motor_mount_v4.scad               # Motor mount source
├── README.md
└── LICENSE


Parts List

PartWhere to getApprox. cost6V DC 130-size motorAmazon$34×AA battery holderAmazon / hardware store$2DPDT toggle switch (optional)Amazon / hardware store$1Hot glue + super glueHardware store$5PLA filament (for printing)Already at print lab—Total~$11


Print Settings

SettingValueMaterialPLALayer height0.2mmInfill40%Walls3SupportsNone neededPrint orientationFlat side down

Estimated print times:


GentlePropulsionTop: ~2–3 hours
GentlePropulsionTail: ~45 minutes
motor_mount_v4: ~20 minutes



Assembly Instructions

What you need


All 3 printed parts
6V DC motor
Hot glue gun
Super glue
4×AA battery pack


Steps

1. Attach motor mount to rotor
Push the motor mount up through the square portal hole on the flat base of the rotor until the square block is flush. Hot glue around all edges where the block meets the rotor portal. Let cure fully.

2. Insert motor into mount
Slide the motor into the round collar from below, shaft pointing up into the portal hole. Add a drop of super glue where the shaft tip meets inside the portal hole. Let cure fully — this is what transfers spin from shaft to rotor.

3. Mount assembly into tail cone
Drop the full assembly (rotor + mount + motor) onto the tail cone, motor body hanging down inside the cone. Hot glue around the collar where it contacts the cone inner wall to stop the motor from spinning.

4. Wire up
Connect the two motor wires to your 4×AA battery pack. Touch wires to battery terminals to test. For forward/reverse, wire in a DPDT switch or simply swap the two motor wires.

5. Test
Hold the tail cone firmly, connect power, and confirm the rotor spins. Test in a bucket of water — tail pointing backward, rotor forward. Measure thrust at different voltages.


Experiment

Hypothesis

A hemispherical lobe rotor will generate measurable thrust in both water and air, with thrust increasing proportionally with voltage.

Method


Mount the assembled VortexLobe on a kitchen scale facing down
Connect motor to variable voltage supply (3V, 4.5V, 6V)
Record thrust in grams at each voltage
Repeat in water and in air
Compare efficiency: Thrust (g) / Power (Watts)


Variables


Independent: Voltage (3V, 4.5V, 6V) and medium (water vs air)
Dependent: Thrust in grams
Controlled: Motor, rotor, test distance, temperature



License

This project is licensed under the GNU Affero General Public License v3.0 (AGPL v3) — the same license as the original Gentle Propulsion project.

See LICENSE for full details.
https://www.gnu.org/licenses/agpl-3.0.html


Acknowledgements


Robert L. Read — original Gentle Propulsion design, open-source publication, and permission to build on this work
Public Invention — https://pubinv.org
HCC Fabrication & Innovation Lab — 3D printing support


