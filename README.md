# VortexLobe
 
An open-source unscrew propeller built on Robert L. Read's *Gentle Propulsion* design. Instead of traditional flat blades, VortexLobe uses four curved hemispherical lobes on a spherical rotor to generate thrust in water and air.
 
![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)
![Built with OpenSCAD](https://img.shields.io/badge/Built%20with-OpenSCAD-orange)
![3D Printed](https://img.shields.io/badge/3D%20Printed-PLA-green)
 
> Built with full permission from **Robert L. Read** of [Public Invention](https://pubinv.org).
 
---
 
## About
 
VortexLobe is an alternative propulsion system that replaces traditional propeller blades with four curved hemispherical lobes attached to a spherical rotor. When the rotor spins, the lobes push fluid axially through a rotational unscrewing motion, generating forward thrust.
 
The curved lobe geometry is also potentially safer for aquatic life than a standard propeller, since organisms that come into contact with the rotor are less likely to be injured.
 
This project tests whether the design generates measurable thrust in water and air, and how efficiency changes across different voltages.
 
---
 
## Credits
 
This project is a direct extension of the **Gentle Propulsion** project by **Robert L. Read**:
 
| | |
|---|---|
| Original repo | [github.com/PubInv/unscrew-propeller](https://github.com/PubInv/unscrew-propeller) |
| Original author | Robert L. Read, Public Invention |
| Original license | AGPL v3 / CERN OHL-S v2 |
 
---
 
## What's Different
 
| Feature | Gentle Propulsion (original) | VortexLobe |
|---|---|---|
| Rotor | Hemisphere with 4 lobes | Same (unchanged) |
| Tail cone | Tapered cone | Same (unchanged) |
| Motor mount | None — drill + wooden shaft | 3D printed mount |
| Power source | Manual drill | 6V DC motor |
| Direction | One direction | Forward + reverse |
 
---
 
## File Structure
 
```
VortexLobe/
├── STL/
│   ├── GentlePropulsionTop.stl         # Main rotor with 4 lobes
│   ├── GentlePropulsionTail.stl        # Tail cone housing
│   └── motor_mount_v4.stl              # Motor mount hub
├── SCAD/
│   ├── GentlePropulsion_MotorMount.scad
│   └── motor_mount_v4.scad
├── README.md
└── LICENSE
```
 
---
 
## Parts List
 
| Part | Source | Cost |
|---|---|---|
| 6V DC 130-size motor | Amazon | ~$3 |
| 4×AA battery holder | Amazon | ~$2 |
| DPDT toggle switch | Hardware store | ~$1 |
| Hot glue + super glue | Hardware store | ~$5 |
| PLA filament | — | — |
| **Total** | | **~$11** |
 
---
 
## Print Settings
 
| Setting | Value |
|---|---|
| Material | PLA |
| Layer height | 0.2mm |
| Infill | 40% |
| Walls | 3 |
| Supports | None needed |
| Orientation | Flat side down |
 
| File | Estimated print time |
|---|---|
| GentlePropulsionTop | 2–3 hours |
| GentlePropulsionTail | ~45 minutes |
| motor_mount_v4 | ~20 minutes |
 
---
 
## Assembly
 
**What you need**
- All 3 printed parts
- 6V DC motor
- Hot glue gun and super glue
- 4×AA battery pack
**Step 1 — Attach motor mount to rotor**
Push the motor mount up through the square portal hole on the flat base of the rotor until the square block sits flush with the surface. Hot glue around all edges where the block meets the rotor. Let cure fully before moving on.
 
**Step 2 — Insert motor into mount**
Slide the motor into the round collar from below, shaft pointing up into the portal hole. Add a drop of super glue where the shaft tip meets the inside of the portal hole. This is what transfers spin from the shaft to the rotor — let it cure completely.
 
**Step 3 — Mount into tail cone**
Drop the full assembly into the tail cone with the motor body hanging down inside. Hot glue around the collar where it contacts the cone inner wall to prevent the motor from rotating.
 
**Step 4 — Wire up**
Connect the two motor wires to the 4×AA battery pack. Swap the wires to reverse direction.
 
**Step 5 — Test**
Hold the tail cone firmly, connect power, and confirm the rotor spins cleanly. Test in a bucket of water with the tail pointing backward, then in air.
 
---
 
## Experiment
 
**Hypothesis**
A hemispherical lobe rotor will generate measurable thrust in both water and air, with thrust increasing as voltage increases.
 
**Variables**
 
| Type | Variable |
|---|---|
| Independent | Voltage (3V, 4.5V, 6V) and medium (water vs air) |
| Dependent | Thrust in grams |
| Controlled | Motor, rotor, test distance, temperature |
 
**Method**
1. Mount VortexLobe on a kitchen scale facing down
2. Connect motor to a voltage source
3. Record thrust in grams at 3V, 4.5V, and 6V
4. Repeat in water and in air
5. Calculate efficiency using `Thrust (g) / Power (W)`
---
 
## License
 
Licensed under the **GNU Affero General Public License v3.0 (AGPL v3)**, the same as the original Gentle Propulsion project.
 
See [LICENSE](LICENSE) or [gnu.org/licenses/agpl-3.0.html](https://www.gnu.org/licenses/agpl-3.0.html) for details.
 
---
 
## Acknowledgements
 
- **Robert L. Read** — original Gentle Propulsion design, open-source publication, and permission to build on this work
- **Public Invention** — [pubinv.org](https://pubinv.org)
- **HCC Fabrication & Innovation Lab** — 3D printing support
---
 
*VortexLobe — Science Fair Project, 2026*
 
