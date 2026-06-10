# VortexLobe
 
A 3D printed aquatic and aerial propulsion system built on the open-source Gentle Propulsion design by Robert L. Read of [Public Invention](https://pubinv.org). This project adds a motorized mount to make the unscrew propeller self-powered, and tests whether it generates measurable thrust in water and air.
 
This project was developed with the knowledge and permission of Robert L. Read.
 
---
 
# Background
 
The unscrew propeller was originally conceived by Robert L. Read in 2022 as an alternative to the traditional screw propeller. Rather than using flat angled blades, it uses four curved hemispherical lobes attached to a spherical rotor. When spun, the lobes push fluid axially through a rotational unscrewing motion, generating thrust without sharp edges.
 
The original design was tested in a hot tub using a battery-powered drill and a wooden shaft glued to a long drill bit. It appeared to move with moderate force on the first try. Robert's full writeup, experiment notes, and original OpenSCAD files are available at [github.com/PubInv/unscrew-propeller](https://github.com/PubInv/unscrew-propeller).
 
The goal of VortexLobe is to take that original design and make it self-powered using a 6V DC motor and a fully 3D printed motor mount, then measure the thrust it produces at different voltages in both water and air.
 
---
 
# My Contributions
 
Robert's original experiment used a cordless drill and a wooden shaft to spin the rotor — there was no way to run it independently without someone holding a drill. My goal was to make it a standalone motorized device that could run controlled, repeatable experiments without any hand-held tools.
 
To do this I designed a 3D printed motor mount from scratch in OpenSCAD. It has a round collar that grips the motor body and a square hub that keys directly into the rotor's portal hole, transferring the motor's spin to the rotor. This was the main engineering challenge of the project — the mount had to fit inside the tail cone, align the shaft precisely with the portal hole, and hold the motor from rotating under load, all within the tight geometry of the original design.
 
I went through four iterations of the mount before getting the fit right, adjusting collar diameter, wall thickness, and block height each time based on test prints. The final version fits a standard 130-size 6V DC motor and allows the full assembly to be tested hands-free at different voltages.
 
---
 
# Files
 
The STL folder contains three files ready to print:
 
- `GentlePropulsionTop.stl` — the original rotor, unchanged from Robert's design
- `GentlePropulsionTail.stl` — the original tail cone, unchanged
- `motor_mount_v4.stl` — a new motor mount hub designed for a standard 130-size 6V DC motor
The SCAD folder contains the full OpenSCAD source for both the motor mount and the combined assembly file.
 
---
 
# Building It
 
The total parts cost is around $11. You need a 6V DC 130-size motor (about $3 on Amazon), a 4×AA battery holder, some hot glue, and super glue. A DPDT toggle switch is optional but makes forward/reverse switching much cleaner.
 
Print all three parts in PLA at 0.2mm layer height, 40% infill, 3 walls, no supports. The rotor takes about 2–3 hours. The tail cone is about 45 minutes. The motor mount is about 20 minutes.
 
To assemble, push the motor mount up through the portal hole in the rotor and hot glue it in place. Slide the motor into the mount collar from below, shaft pointing up, and add a drop of super glue where the shaft meets the portal hole. Drop the full assembly into the tail cone and hot glue the collar against the inner cone wall to keep the motor from rotating. Wire the motor to the battery pack and swap the wires to reverse direction.
 
---
 
# Experiment
 
The central question is whether this design generates measurable thrust, and how that thrust changes with voltage and fluid medium.
 
I measured thrust by mounting the propeller on a kitchen scale facing down and recording the reading in grams at 3V, 4.5V, and 6V. I ran the same test in a bucket of water and in air. The independent variables are voltage and medium, the dependent variable is thrust in grams, and everything else (motor, rotor, distance, temperature) is held constant.
 
Efficiency is calculated as thrust divided by power input (volts × amps), which gives grams per watt.
 
---
 
# Results
 
*To be updated after testing.*
 
---
 
# Possible Issues
 
Reverse thrust does not work the same way as with a screw propeller. Robert noted this in his original README — unlike a screw, you cannot simply reverse the spin direction to go backward with equal force. This is worth investigating experimentally and is one of the more interesting open questions about the design.
 
It is also possible, as Robert pointed out, that the thrust observed in a closed vessel like a hot tub could be an artifact of reflected currents. Testing in open water or a large pool would help eliminate that concern.
 
---
 
# What's Next
 
Robert's May 2026 update suggests the most promising direction is a contra-rotating version, where the outer hemisphere shell and inner lobe assembly spin in opposite directions, driven by a geared bevel gear system from a single motor. This would cancel out the torque imparted to the fluid and potentially improve efficiency significantly. That is a future version of this project.
 
---
 
# License
 
The OpenSCAD code in this repository is licensed under the GNU Affero General Public License v3.0, the same as the original Gentle Propulsion code. The hardware designs are licensed under CERN OHL Strongly Reciprocal V2. This text is licensed under Creative Commons By Attribution.
 
See [gnu.org/licenses/agpl-3.0.html](https://www.gnu.org/licenses/agpl-3.0.html) for the full license text.
 
---
 
# Acknowledgements
 
Robert L. Read and Public Invention, for making the original Gentle Propulsion design open source and for giving permission to build on it.
 
HCC Fabrication and Innovation Lab, for 3D printing support.
 
---
