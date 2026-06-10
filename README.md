# 🌀 VortexLobe
 
> An open-source unscrew propeller — built on Robert L. Read's *Gentle Propulsion* design, powered by a 6V DC motor, and fully 3D printed.
 
![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)
![Built with OpenSCAD](https://img.shields.io/badge/Built%20with-OpenSCAD-orange)
![3D Printed](https://img.shields.io/badge/3D%20Printed-PLA-green)
![Science Fair 2026](https://img.shields.io/badge/Science%20Fair-2026-purple)
 
---
 
## 📌 About
 
VortexLobe is an alternative propulsion system that replaces traditional flat propeller blades with **four curved hemispherical lobes** on a spherical rotor. When the rotor spins, the lobes interact with the surrounding fluid in a rotational "unscrewing" motion — generating thrust in both **water and air**.
 
This design is potentially **safer for aquatic life** than traditional propellers, as the curved geometry reduces the risk of injury to organisms that come into contact with the spinning rotor.
 
> ✅ Built with full permission from **Robert L. Read** of [Public Invention](https://pubinv.org)
 
---
 
## 🎯 Goals
 
- ✅ Generate measurable thrust in water
- ✅ Generate measurable thrust in air
- ✅ Test efficiency at multiple voltages (3V, 4.5V, 6V)
- ✅ Compare efficiency to a traditional propeller
- ✅ Keep it fully 3D printable and under $15
---
 
## 🙏 Credits
 
This project is a direct extension of the **Gentle Propulsion** project by **Robert L. Read**:
 
| | |
|---|---|
| 📁 Original Repo | [github.com/PubInv/unscrew-propeller](https://github.com/PubInv/unscrew-propeller) |
| 👤 Original Author | Robert L. Read, Public Invention |
| 📄 Original License | AGPL v3 / CERN OHL-S v2 |
 
---
 
## 🆕 What's New in VortexLobe
 
| Feature | Original (Gentle Propulsion) | VortexLobe |
|---|---|---|
| Rotor design | Hemisphere with 4 lobes | Same (unchanged) |
| Tail cone | Tapered cone | Same (unchanged) |
| Motor mount | None (drill + wooden shaft) | 3D printed motor mount |
| Power | Manual drill | 6V DC motor |
| Direction control | One direction | Forward + reverse |
 
---
 
## 📁 File Structure
 
```
VortexLobe/
├── 📂 STL/
│   ├── GentlePropulsionTop.stl       # Main rotor with 4 lobes
│   ├── GentlePropulsionTail.stl      # Tail cone housing
│   └── motor_mount_v4.stl            # Motor mount hub
├── 📂 SCAD/
│   ├── GentlePropulsion_MotorMount.scad
│   └── motor_mount_v4.scad
├── README.md
└── LICENSE
```
 
---
 
## 🛒 Parts List
 
| Part | Source | Cost |
|---|---|---|
| 6V DC 130-size motor | Amazon | ~$3 |
| 4×AA battery holder | Amazon | ~$2 |
| DPDT toggle switch | Hardware store | ~$1 |
| Hot glue + super glue | Hardware store | ~$5 |
| PLA filament | Print lab | — |
| **Total** | | **~$11** |
 
---
 
## 🖨️ Print Settings
 
| Setting | Value |
|---|---|
| Material | PLA |
| Layer height | 0.2mm |
| Infill | 40% |
| Walls | 3 |
| Supports | ❌ None needed |
| Orientation | Flat side down |
 
| File | Est. Print Time |
|---|---|
| GentlePropulsionTop | ~2–3 hours |
| GentlePropulsionTail | ~45 minutes |
| motor_mount_v4 | ~20 minutes |
 
---
 
## 🔧 Assembly
 
### Requirements
- All 3 printed parts
- 6V DC motor
- Hot glue gun + super glue
- 4×AA battery pack
### Steps
 
**Step 1 — Attach motor mount to rotor**
Push the motor mount up through the square portal hole on the flat base of the rotor until the square block sits flush. Hot glue around all edges. Let cure fully.
 
**Step 2 — Insert motor into mount**
Slide the motor into the round collar from below, shaft pointing up. Add super glue where the shaft tip meets the portal hole. Let cure — this transfers spin from shaft to rotor.
 
**Step 3 — Mount into tail cone**
Drop the full assembly into the tail cone, motor body hanging down inside. Hot glue around the collar against the cone inner wall to stop the motor from spinning.
 
**Step 4 — Wire up**
Connect motor wires to 4×AA battery pack. Swap wires for reverse direction.
 
**Step 5 — Test**
Hold tail cone firmly, connect power, rotor spins. Test in water and air!
 
---
 
## 🔬 Experiment
 
### Hypothesis
> A hemispherical lobe rotor will generate measurable thrust in both water and air, with thrust increasing proportionally with voltage.
 
### Variables
 
| Type | Variable |
|---|---|
| Independent | Voltage (3V, 4.5V, 6V) and medium (water vs air) |
| Dependent | Thrust (grams) |
| Controlled | Motor, rotor, test distance, temperature |
 
### Method
1. Mount VortexLobe on a kitchen scale facing down
2. Connect motor to voltage source
3. Record thrust in grams at 3V, 4.5V, and 6V
4. Repeat in water and in air
5. Calculate efficiency: `Thrust (g) / Power (W)`
---
 
## 📄 License
 
This project is licensed under the **GNU Affero General Public License v3.0 (AGPL v3)** — the same license as the original Gentle Propulsion project.
 
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0.html)
 
---
 
## 🏫 Acknowledgements
 
- 🧠 **Robert L. Read** — original design, open-source publication, and permission to build on this work
- 🌍 **Public Invention** — [pubinv.org](https://pubinv.org)
- 🏗️ **HCC Fabrication & Innovation Lab** — 3D printing support
---
 



