# DC Flow Analysis

This project provides a MATLAB implementation for DC power flow analysis, with and without losses. It includes all the necessary files to simulate and analyze DC systems based on input data provided by the user.

## Features

- **Lossless DC Flow Calculation**: Implemented in `CalcThetas.m`.
- **DC Flow with Losses**: Implemented in `CalcThetas2.m`.
- **Customizable Input Data**: Define your system using the provided example format in `Data_Example.txt`.
- **Result Display and Analysis**: Functions to display results (`DispResults.m`) and manage output data.
- **Y-Bus Matrix Generation**: Constructed using `MakeYBus.m`.

---

## Getting Started

### Prerequisites

- MATLAB installed on your machine.
- Basic knowledge of DC power flow concepts.

---

### File Descriptions

- **`Main.m`**  
  The main script to run the DC flow analysis. Start your analysis by executing this file.

- **`Data_Example.txt`**  
  Example of the input data format. Users must follow this structure to define their system parameters in a `.txt` file.

- **`CalcThetas.m`**  
  Computes the DC power flow without considering losses.

- **`CalcThetas2.m`**  
  Computes the DC power flow including system losses.

- **`DispAll.m`**  
  Displays all computed results and provides a complete overview of the analysis.

- **`DispResults.m`**  
  Displays specific results of interest, such as power flows and voltages.

- **`GetPesp.m`**  
  Extracts or computes the power injection vector from the input data.

- **`MakeYBus.m`**  
  Constructs the Y-Bus matrix based on the input system data.

- **`ReadData.m`**  
  Reads the input file (e.g., `Data_Example.txt`) and processes the data for analysis.

- **`README.md`**  
  This file, containing information about the project, its structure, and how to use it.

---

## How to Use

1. **Prepare Your Input Data**:  
   - Edit the input `.txt` file (e.g., `Data_Example.txt`) to define your system's parameters.
   - Follow the format provided in the example.

2. **Run the Main Script**:  
   - Open MATLAB and navigate to the project folder.
   - Run `Main.m` by typing the following in the MATLAB Command Window:
     ```matlab
     run('Main.m')
     ```

3. **Choose the Flow Type**:  
   - Use the appropriate function (`CalcThetas.m` or `CalcThetas2.m`) for lossless or lossy DC flow analysis.

4. **View Results**:  
   - Use `DispResults.m` or `DispAll.m` to visualize the outcomes.

---

## Example Usage

1. Set up the input file `Data_Example.txt`:

2. Run the `Main.m` script:
```matlab
run('Main.m')
