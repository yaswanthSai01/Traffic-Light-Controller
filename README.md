# Traffic-Light-Controller

🚦*Traffic Light Controller in Verilog* 🚦< br / >
Overview 📋< br / >
This project implements a Traffic Light Controller designed to manage traffic lights at a four-way junction, controlling the intersection between a main road and a side road. The system operates based on sensor inputs that detect vehicles or pedestrians on the side road, along with predefined timing parameters for green, yellow, and red light durations.< br / >

*Key Features* 🌟< br / >
🚗 Sensor Input: Detects vehicles or pedestrians on the side road, triggering light changes.< br / >
🔄 State Machine Design: Utilizes a finite state machine (FSM) to control the traffic light sequence.< br / >
⏲️ Configurable Timing Parameters: Adjustable durations for green, yellow, and red lights to suit specific traffic conditions.< br / >
💡 Output Signals: Controls traffic lights for both the main road and the side road using 2-bit signals.< br / >
*State Machine (FSM) States* 🛑🟡🟢< br / >
S0: Main road is green, side road is red.< br / >
S1: Main road is yellow, side road is red.< br / >
S2: Main road is red, side road is green.< br / >
S3: Main road is red, side road is yellow.< br / >
*Timing Parameters* ⏱️< br / >
TL (Main Road Green Light): 10 seconds.< br / >
TS (Side Road Green Light): 6 seconds.< br / >
TY (Yellow Light): 4 seconds for both roads.< br / >
*State Transition Logic* 🔄< br / >
S0 to S1: Transition occurs when TL expires and a vehicle is detected on the side road.< br / >
S1 to S2: Transition occurs after the TY duration expires.< br / >
S2 to S3: Transition occurs after the TS duration expires.< br / >
S3 to S0: Transition occurs after the TY duration expires.< br / >
*Implementation Details* 🛠️< br / >
The system uses a finite state machine to manage state transitions and control traffic lights. The output logic determines the light signals (Red, Green, Yellow) for both the main road and the side road based on the current state of the FSM.< br / >

*Output Logic* 💡< br / >
00: Red< br / >
01: Green< br / >
10: Yellow< br / >
*Simulation* 🧪< br / >
A testbench provides a simulation environment to verify the functionality of the Traffic Light Controller. The simulation tests all state transitions and ensures the correctness of the output signals under various scenarios.< br / >
< br / >
*Tools Used* 🛠️< br / >
Vivado Software< br / >
EDA Playground< br / >
*Conclusion* 📌< br / >
This project demonstrates a practical application of finite state machines (FSM) in managing traffic flow at an intersection. The use of sensor inputs and configurable timing parameters enables the controller to efficiently manage traffic lights between a main road and a side road, ensuring smooth traffic flow and safety.< br / >

*Author* ✍️< br / >
Yaswanth Sai Kotyada
