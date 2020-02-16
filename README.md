Mimas V2 sample project
=======================

This repository is meant to be a ready-to-go starting project for the Mimas V2 development board. Setting up a project for a dev board can be quite tedious, so I figure it'd faster to do it once and re-use this template for new projects.

This manual is written for Windows. I haven't tried to program the Mimas V2 on Linux and I'm not sure how it works.


Prerequisites
-------------

  1. Have [Xilinx ISE WebPACK](https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html) installed. You need to register, but the program itself is free to use. Note that the Spartan 6 FPGA which is on the Mimas V2 is not supported by the newer Vivado Design Suite, so you really need Xilinx ISE, even though Xilinx recommends new projects to use Vivado Design Suite. Download it [here](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html).
  2. Have the USB CDC drivers for windows installed. They can be downloaded from Numato [here](https://numato.com/wp-content/uploads/2019/06/numatocdcdriver.zip).
  3. Have the configuration tool for windows available. It can be downloaded from Numato [here](https://productdata.numato.com/assets/downloads/fpga/mimasv2/mimasv2_configuration_tool_windows.exe).


How to build this project
-------------------------

  1. Clone this project:

    git clone https://github.com/rubenvannieuwpoort/mimasv2_base

  2. Open the project by doubleclicking on minispartan6+.xise, or open Xilinx ISE WebPACK and open the file from there.
  3. In the design pane on the left, make sure that 'implementation' is selected. In the second window from the top (the one under the message 'no processes running'), there should be a text that says 'Generate Programming File' (you might need to scroll down). Doubleclick this and wait until the process is done. A bitstream file main.bin should be generated in the repository folder.

How to program the Mimas V2
---------------------------

You should have followed the previous instructions on how to build this project and obtain the bitstream, called main.bin.

  1. Connect the Mimas V2 to your computer with a micro USB cable.
  2. Now, we'll figure out to which COM port the FPGA is connected. This depends on the USB port that the development board is connected to. Once you know which COM port corresponds to the USB port that the dev board is connected to, you can skip this step.
Open the device manager and look for 'Ports (COM & LPT)'. Click on it to expand. You should see something like 'Numato Lab Mimas V2 Spartan 6 Development Board (COMX)', with a number instead of the X in 'COMX'. This is the COM port we're looking for; Remember it.
  3. Open the configuration tool. Click 'open file' and navigate to the project folder, and select the main.bin file.
  4. Select the COM port we found in step 2, and click 'Program'. The configuration tool should start programming the flash memory (which takes a while). When it is done your design should start running. It is persistent, so every time you power up the development board, it should start running your design until you overwrite is with another design.
