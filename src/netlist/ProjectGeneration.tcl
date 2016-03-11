#
# Created by System Generator     Tue Dec 16 01:55:24 2014
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {HDL Netlist}
    set Project {color_space_cw}
    set DSPFamily {Virtex5}
    set DSPDevice {xc5vlx110t}
    set DSPPackage {ff1136}
    set DSPSpeed {-1}
    set HDLLanguage {verilog}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set CreateInterfaceDocument {off}
    set NewXSTParser {0}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{color_space_cw.v} -view All}
        {{color_space.v} -view All}
        {{color_space_cw.ucf}}
        {{color_space_cw.xdc}}
        {{C:\Users\Sechw\Documents\MATLAB\4440\Color_Space.slx}}
    }
    set TopLevelModule {color_space_cw}
    set SynthesisConstraintsFile {color_space_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
