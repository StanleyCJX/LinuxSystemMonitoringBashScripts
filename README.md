# Linux System Monitoring Bash Scripts

This repository contains a collection of Bash scripts developed as part of a university assignment (UCCD 2103 Operating Systems, Part B). The project aims to expose students to Linux OS administration, commands, and bash scripting through the development of various system resource monitoring tools. Each script focuses on tracking a specific system resource (CPU, RAM, Virtual Memory, or Network Utilization) and logging the data into a CSV file, with the ability to run in the background and be stopped gracefully.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the Scripts](#running-the-scripts)
  - [Stopping Background Scripts](#stopping-background-scripts)
- [Project Structure](#project-structure)
- [Contributors](#contributors)
- [License](#license)

## About

This project involves the creation of Bash shell scripts for monitoring various system resources on a Linux operating system (specifically Lubuntu 22.04, running in a virtual machine environment). The scripts are designed to:
* Capture real-time system resource utilization (e.g., CPU, RAM, Virtual Memory, Network I/O).
* Log the collected data, including timestamps, into respective `.csv` files.
* Support configurable monitoring intervals.
* Allow execution as background processes.
* Provide a separate script for gracefully stopping the background monitoring processes.

The assignment emphasizes practical application of Linux commands (`ps`, `date`, `cat`, `grep`, `awk`, `kill`), bash scripting fundamentals, and process management.

## Features

* **CPU Resource Monitoring (`CPU.sh`)**:
    * Identifies and records the task with the highest CPU utilization (percentage) at specified intervals. 
    * Logs data into `CPU.csv` with `hr:min:sec`, task name, and `%CPU` consumption. 
    * Supports user-defined monitoring periods, with a default of 60 seconds if no input is provided. 
* **RAM Resource Monitoring (`RAM.sh`)**:
    * Tracks the process with the highest RAM utilization (`%MEM`) at configurable intervals. 
    * Appends current time, process name, and `%MEM` usage to `RAM.csv`. 
* **Virtual Memory (VM) Resource Monitoring (`VM.sh`)**:
    * (Details not fully available in provided snippets, but implied functionality) Tracks processes with the highest virtual memory (VSZ) consumption at configurable intervals. 
* **Network Utilization Monitoring (`network.sh`)**:
    * (Details not fully available in provided snippets, but implied functionality) Monitors total network consumption (RX and TX in KB) and records it into `network.csv`. 
    * Supports user-defined periods (1-60 seconds), with a default of 60 seconds. 
* **Background Execution**: Scripts can be run in the background using the `&` operator. 
* **Graceful Termination**: Dedicated stop scripts (`CPU-stop.sh`, `RAM-stop.sh`, `VM-stop.sh`, `network-stop.sh`) are provided to terminate the respective background monitoring processes. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* A Linux operating system (recommended: Lubuntu 22.04 LTS). 
* A virtual machine environment (e.g., VirtualBox or VMware Workstation Player) is recommended for installation and testing. 
* Basic understanding of Linux commands and Bash scripting.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/linux-system-monitoring.git](https://github.com/your-username/linux-system-monitoring.git)
    cd linux-system-monitoring
    ```
    (Note: Replace `your-username/linux-system-monitoring` with the actual repository URL when uploaded to GitHub.)

2.  **Create project folder (if not already existing):**
    Each script type (CPU, RAM, VM, Network) typically has its own directory. For example, for CPU monitoring:
    ```bash
    cd ~
    mkdir cpu_monitor
    cd cpu_monitor
    ``` 

3.  **Place the script files:**
    Copy the `.sh` files (e.g., `CPU.sh`, `CPU-stop.sh`) into their respective project folders.

4.  **Grant executable permissions:**
    Before running any script, you need to make it executable:
    ```bash
    chmod +x CPU.sh
    chmod +x CPU-stop.sh
    # Repeat for other scripts (RAM.sh, RAM-stop.sh, etc.)
    ``` 

### Running the Scripts

To run a monitoring script, execute it from the terminal. You can specify a monitoring interval in seconds as an argument. If no interval is provided, a default of 60 seconds will be used. 

**Example: Running `CPU.sh`**
* Run with a 4-second interval:
    ```bash
    ./CPU.sh 4
    ``` 
* Run with the default 60-second interval:
    ```bash
    ./CPU.sh
    ``` 

**Example: Running `RAM.sh`**
* Run with a 2-second interval:
    ```bash
    ./RAM.sh 2
    ``` 

To run a script in the background, append `&` to the command:
```bash
./CPU.sh 4 &
``` 

### Stopping Background Scripts

To stop a background monitoring script, use its corresponding stop script. This script identifies and terminates the running process.

**Example: Stopping `CPU.sh`**
```bash
./CPU-stop.sh
``` 
You can verify if the process has stopped by checking the process list:
```bash
ps -ef | grep CPU.sh | grep -v grep
``` 
If no output is displayed, the script has successfully terminated. 

## Project Structure

The project typically includes the following files for each resource monitoring task:

* `[resource].sh`: The main Bash script for monitoring the specific resource (e.g., `CPU.sh`, `RAM.sh`, `network.sh`, `VM.sh`). 
* `[resource]-stop.sh`: A Bash script to stop the corresponding monitoring script running in the background. 
* `[resource].csv`: The log file where the monitoring data is recorded (e.g., `CPU.csv`, `RAM.csv`, `network.csv`, `VM.csv`). 

## Contributors

This project was developed as a group assignment, with individual contributions to different monitoring tasks:

* **Lim Jin Zhao**
* **Stanley Chew Jun Xian**
* **Wong Carman**
* **Chan Zhun Seang**

## License

This project was developed as an assignment for the "Operating Systems" course at Universiti Tunku Abdul Rahman.