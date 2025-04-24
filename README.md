# DC Power Flow Analysis in MATLAB (with and without losses)

This project provides a MATLAB-based implementation for **DC power flow analysis** in electrical power systems. It supports both **lossless** and **lossy** DC power flow methods, allowing users to analyze different system configurations using input data provided in `.txt` files.

---

## ⚙️ Features

- 🔌 **Lossless DC Flow Calculation** – Implemented in `CalcThetas.m`
- 🔥 **DC Flow with Losses** – Implemented iteratively in `CalcThetas2.m`
- 📁 **Customizable Input Data** – Based on user-defined text files (e.g., `Data_Example.txt`)
- 📊 **Results Display** – Formatted results output using `DispResults.m`
- 🔣 **Y-Bus Matrix Generation** – Automatically built from system data using `MakeYBus.m`

---

## 🚀 Getting Started

### ✅ Prerequisites

- MATLAB (R2016 or newer recommended)
- Basic knowledge of power system analysis and DC power flow

### 📁 File Structure

| File               | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `main.m`           | Main script to execute the DC power flow analysis                           |
| `Data_Example.txt` | Template for input data – follow this format for your own system definition |
| `ReadData.m`       | Reads and parses the input `.txt` file                                      |
| `MakeYBus.m`       | Builds the Y-Bus matrix for the DC system                                   |
| `GetPesp.m`        | Computes the power injection vector (Pesp)                                  |
| `CalcThetas.m`     | Performs lossless DC power flow analysis                                    |
| `CalcThetas2.m`    | Performs DC power flow analysis with losses using iterative correction      |
| `DispResults.m`    | Displays the results of power flows, losses, and angles                     |

---

## 🧪 How to Use

1. **Prepare Your Input File**  
   - Use `Data_Example.txt` as a reference.
   - Create your own data file (e.g., `dados_sistema13B_EC3_Teste1.txt`) using the same structure.

2. **Run the Analysis**
   - Open MATLAB and navigate to the project folder.
   - Execute the main script:
     ```matlab
     run('main.m')  % or 'Main.m', depending on your file name
     ```

3. **Choose the Flow Type**
   - The script automatically computes:
     - Lossless DC flow (`CalcThetas.m`)
     - Lossy DC flow with iteration (`CalcThetas2.m`)

4. **View Results**
   - Outputs are displayed in the MATLAB console.
   - Use `DispResults.m` to format and explore results in more detail.

---

## 📌 Example Usage

Example:
```matlab
% In main.m
% Make sure have:
filename = 'dados_sistema13B_EC3_CasoBase.txt';
% Run the Main.m
