# 🛖 Traffic Light Controller in Verilog 🛖

## Overview 📋
This project implements a **Traffic Light Controller** designed to manage traffic lights at a four-way junction, controlling the intersection between a main road and a side road. The system operates based on **sensor inputs** that detect vehicles or pedestrians on the side road, along with **predefined timing parameters** for green, yellow, and red light durations.

## Key Features 🌟
- **🚗 Sensor Input:** Detects vehicles or pedestrians on the side road, triggering light changes.
- **🔄 State Machine Design:** Utilizes a finite state machine (FSM) to control the traffic light sequence.
- **⏱️ Configurable Timing Parameters:** Adjustable durations for green, yellow, and red lights to suit specific traffic conditions.
- **💡 Output Signals:** Controls traffic lights for both the main road and the side road using 2-bit signals.

## State Machine (FSM) States 🛑🟡🟢
- **S0:** Main road is green, side road is red.
- **S1:** Main road is yellow, side road is red.
- **S2:** Main road is red, side road is green.
- **S3:** Main road is red, side road is yellow.

## Timing Parameters ⏳
- **TL (Main Road Green Light):** 10 seconds.
- **TS (Side Road Green Light):** 6 seconds.
- **TY (Yellow Light):** 4 seconds for both roads.

## State Transition Logic 🔄
- **S0 to S1:** Transition occurs when TL expires and a vehicle is detected on the side road.
- **S1 to S2:** Transition occurs after the TY duration expires.
- **S2 to S3:** Transition occurs after the TS duration expires.
- **S3 to S0:** Transition occurs after the TY duration expires.

## Implementation Details 🛠️
The system uses a **finite state machine** to manage state transitions and control traffic lights. The **output logic** determines the light signals (Red, Green, Yellow) for both the main road and the side road based on the current state of the FSM.

### Output Logic 💡
- **00:** Red
- **01:** Green
- **10:** Yellow

## Simulation 🧬
A **testbench** provides a simulation environment to verify the functionality of the Traffic Light Controller. The simulation tests all state transitions and ensures the correctness of the output signals under various scenarios.

## Tools Used 🛠️
- **Vivado Software**
- **EDA Playground**

## Conclusion 📌
This project demonstrates a practical application of **finite state machines (FSM)** in managing traffic flow at an intersection. The use of sensor inputs and configurable timing parameters enables the controller to efficiently manage traffic lights between a main road and a side road, ensuring smooth traffic flow and safety.

## Author ✍️
[Yaswanth Sai Kotyada]
```


