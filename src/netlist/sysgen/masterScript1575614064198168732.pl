
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'C:/Xilinx/14.7/ISE_DS/ISE/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'HDL_PATH' => 'C:/Users/Sechw/Documents/MATLAB/4440',
    'Impl_file' => 'ISE Defaults',
    'Impl_file_sgadvanced' => '',
    'Synth_file' => 'XST Defaults',
    'Synth_file_sgadvanced' => '',
    'TEMP' => 'C:/Users/Sechw/AppData/Local/Temp',
    'TMP' => 'C:/Users/Sechw/AppData/Local/Temp',
    'Temp' => 'C:/Users/Sechw/AppData/Local/Temp',
    'Tmp' => 'C:/Users/Sechw/AppData/Local/Temp',
    'base_system_period_hardware' => 10.0,
    'base_system_period_simulink' => 1.0,
    'block_icon_display' => 'Default',
    'block_type' => 'sysgen',
    'block_version' => '',
    'ce_clr' => 0.0,
    'clock_domain' => 'default',
    'clock_loc' => '',
    'clock_wrapper' => 'Clock Enables',
    'clock_wrapper_sgadvanced' => '',
    'compilation' => 'HDL Netlist',
    'compilation_lut' => {
      'keys' => [ 'HDL Netlist', ],
      'values' => [ 'target1', ],
    },
    'compilation_target' => 'HDL Netlist',
    'core_generation' => 1.0,
    'core_generation_sgadvanced' => '',
    'core_is_deployed' => 0.0,
    'coregen_core_generation_tmpdir' => 'C:/Users/Sechw/AppData/Local/Temp/sysgentmp-Sechw/cg_wk/c748618be316815a9',
    'coregen_part_family' => 'virtex5',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'Color_Space',
    'design_full_path' => 'C:\\Users\\Sechw\\Documents\\MATLAB\\4440\\Color_Space.slx',
    'device' => 'xc5vlx110t-1ff1136',
    'device_speed' => '-1',
    'directory' => 'C:/Users/Sechw/Documents/MATLAB/4440/netlist',
    'dsp_cache_root_path' => 'C:/Users/Sechw/AppData/Local/Temp/sysgentmp-Sechw',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/perl_results.v', },
      ],
    ],
    'force_scheduling' => 0.0,
    'fxdptinstalled' => 1.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 2448.0006103515625,
    'generating_subsystem_handle' => 2448.0006103515625,
    'generation_directory' => './netlist',
    'has_advanced_control' => '0',
    'hdlDir' => 'C:/Xilinx/14.7/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'verilog',
    'hdl_path' => 'C:/Users/Sechw/Documents/MATLAB/4440',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '14.7i',
    'master_sysgen_token_handle' => 2449.00048828125,
    'matlab' => 'C:/Program Files/MATLAB/R2013b',
    'matlab_fixedpoint' => 1.0,
    'mdlHandle' => 2448.0006103515625,
    'mdlPath' => 'C:/Users/Sechw/Documents/MATLAB/4440/Color_Space.mdl',
    'modelDiagnostics' => [
      {
        'count' => 122.0,
        'isMask' => 0.0,
        'type' => 'Color_Space Total blocks',
      },
      {
        'count' => 6.0,
        'isMask' => 0.0,
        'type' => 'Buffer',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 12.0,
        'isMask' => 0.0,
        'type' => 'FrameConversion',
      },
      {
        'count' => 18.0,
        'isMask' => 0.0,
        'type' => 'Inport',
      },
      {
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'M-S-Function',
      },
      {
        'count' => 21.0,
        'isMask' => 0.0,
        'type' => 'Outport',
      },
      {
        'count' => 9.0,
        'isMask' => 0.0,
        'type' => 'Reshape',
      },
      {
        'count' => 28.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 14.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'Unbuffer',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Convert 1-D to 2-D',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Convert 2-D to 1-D',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Image From File',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Video Viewer',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Black Box Block',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Multiplexer Block',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'C:/Users/Sechw/Documents/MATLAB/4440/Color_Space.mdl',
    'myxilinx' => 'C:/Xilinx/14.7/ISE_DS/ISE',
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '196608',
    'package' => 'ff1136',
    'part' => 'xc5vlx110t',
    'partFamily' => 'virtex5',
    'port_data_types_enabled' => 0.0,
    'preserve_hierarchy' => 0.0,
    'proj_type' => 'Project Navigator',
    'proj_type_sgadvanced' => '',
    'report_true_rates' => 0.0,
    'run_coregen' => 'off',
    'run_coregen_sgadvanced' => '',
    'sample_time_colors_enabled' => 0.0,
    'sampletimecolors' => 0.0,
    'sg_blockgui_xml' => '',
    'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
    'sg_list_contents' => '',
    'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
    'sg_version' => '',
    'sggui_pos' => '-1,-1,-1,-1',
    'simulation_island_subsystem_handle' => 2448.0006103515625,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => 1.0,
    'speed' => '-1',
    'synth_file' => 'XST Defaults*',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'verilog',
    'synthesis_tool' => 'XST',
    'synthesis_tool_sgadvanced' => '',
    'sysclk_period' => 10.0,
    'sysgen' => 'C:/Xilinx/14.7/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'C:/Xilinx/14.7/ISE_DS/ISE/sysgen',
    'sysgenTokenSettings' => {
      'Impl_file' => 'ISE Defaults',
      'Impl_file_sgadvanced' => '',
      'Synth_file' => 'XST Defaults',
      'Synth_file_sgadvanced' => '',
      'base_system_period_hardware' => 10.0,
      'base_system_period_simulink' => 1.0,
      'block_icon_display' => 'Default',
      'block_type' => 'sysgen',
      'block_version' => '',
      'ce_clr' => 0.0,
      'clock_loc' => '',
      'clock_wrapper' => 'Clock Enables',
      'clock_wrapper_sgadvanced' => '',
      'compilation' => 'HDL Netlist',
      'compilation_lut' => {
        'keys' => [ 'HDL Netlist', ],
        'values' => [ 'target1', ],
      },
      'core_generation' => 1.0,
      'core_generation_sgadvanced' => '',
      'coregen_part_family' => 'virtex5',
      'create_interface_document' => 'off',
      'dbl_ovrd' => -1.0,
      'dbl_ovrd_sgadvanced' => '',
      'dcm_input_clock_period' => 10.0,
      'deprecated_control' => 'off',
      'deprecated_control_sgadvanced' => '',
      'directory' => './netlist',
      'eval_field' => '0',
      'has_advanced_control' => '0',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 2449.00048828125,
      'package' => 'ff1136',
      'part' => 'xc5vlx110t',
      'preserve_hierarchy' => 0.0,
      'proj_type' => 'Project Navigator',
      'proj_type_sgadvanced' => '',
      'run_coregen' => 'off',
      'run_coregen_sgadvanced' => '',
      'sg_blockgui_xml' => '',
      'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
      'sg_list_contents' => '',
      'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
      'sggui_pos' => '-1,-1,-1,-1',
      'simulation_island_subsystem_handle' => 2448.0006103515625,
      'simulink_period' => 1.0,
      'speed' => '-1',
      'synth_file' => 'XST Defaults*',
      'synthesis_language' => 'verilog',
      'synthesis_tool' => 'XST',
      'synthesis_tool_sgadvanced' => '',
      'sysclk_period' => 10.0,
      'testbench' => 0,
      'testbench_sgadvanced' => '',
      'trim_vbits' => 1.0,
      'trim_vbits_sgadvanced' => '',
      'xilinx_device' => 'xc5vlx110t-1ff1136',
      'xilinxfamily' => 'virtex5',
    },
    'sysgen_Root' => 'C:/Xilinx/14.7/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 10.0,
    'tempdir' => 'C:/Users/Sechw/AppData/Local/Temp',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen',
    'trim_vbits' => 1.0,
    'trim_vbits_sgadvanced' => '',
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'usertemp' => 'C:/Users/Sechw/AppData/Local/Temp/sysgentmp-Sechw',
    'using71Netlister' => 1,
    'verilog_files' => [
      'conv_pkg.v',
      'synth_reg.v',
      'synth_reg_w_init.v',
      'convert_type.v',
    ],
    'version' => '',
    'vhdl_files' => [
      'conv_pkg.vhd',
      'synth_reg.vhd',
      'synth_reg_w_init.vhd',
    ],
    'vsimtime' => '2162963.000000 ns',
    'xilinx' => 'C:/Xilinx/14.7/ISE_DS/ISE',
    'xilinx_device' => 'xc5vlx110t-1ff1136',
    'xilinx_family' => 'virtex5',
    'xilinx_package' => 'ff1136',
    'xilinx_part' => 'xc5vlx110t',
    'xilinxdevice' => 'xc5vlx110t-1ff1136',
    'xilinxfamily' => 'virtex5',
    'xilinxpart' => 'xc5vlx110t',
  };
  push(@$results, &Sg::setAttributes($instrs));
  use SgDeliverFile;
  $instrs = {
    'collaborationName' => 'conv_pkg.v',
    'sourceFile' => 'hdl/conv_pkg.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg.v',
    'sourceFile' => 'hdl/synth_reg.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg_w_init.v',
    'sourceFile' => 'hdl/synth_reg_w_init.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'convert_type.v',
    'sourceFile' => 'hdl/convert_type.v',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlpersistentdff.ngc',
    'sourceFile' => 'hdl/xlpersistentdff.ngc',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'df00ddbbbffb586f2252372627cd7287',
    'sourceFile' => 'C:/Users/Sechw/Documents/MATLAB/4440/codegen/rgbtohsv/hdlsrc/rgbtohsv_fixpt.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'aeefdaebb521ca0c56f7cec27fd3d69c',
    'sourceFile' => 'C:/Users/Sechw/Documents/MATLAB/4440/codegen/xyztorgb/hdlsrc/xyztorgb_fixpt.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '05c56fa8eb50c7a8bce27c62c1bc91ff',
    'sourceFile' => 'hdl/xlmcode.v',
    'templateKeyValues' => {
      'crippled_module' => '(
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 1\'b0;
endmodule
',
      'entity_name' => 'constant_ae323e07fc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2a1afcdc16fddd11ed9d2b89ac0bf0d2',
    'sourceFile' => 'hdl/xlmcode.v',
    'templateKeyValues' => {
      'crippled_module' => '(
  input [(2 - 1):0] sel,
  input [(8 - 1):0] d0,
  input [(8 - 1):0] d1,
  input [(8 - 1):0] d2,
  output [(8 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire [(2 - 1):0] sel_1_20;
  wire [(8 - 1):0] d0_1_24;
  wire [(8 - 1):0] d1_1_27;
  wire [(8 - 1):0] d2_1_30;
  reg [(8 - 1):0] unregy_join_6_1;
  assign sel_1_20 = sel;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign d2_1_30 = d2;
  always @(d0_1_24 or d1_1_27 or d2_1_30 or sel_1_20)
    begin:proc_switch_6_1
      case (sel_1_20)
        2\'b00 :
          begin
            unregy_join_6_1 = d0_1_24;
          end
        2\'b01 :
          begin
            unregy_join_6_1 = d1_1_27;
          end
        default:
          begin
            unregy_join_6_1 = d2_1_30;
          end
      endcase
    end
  assign y = unregy_join_6_1;
endmodule
',
      'entity_name' => 'mux_1495816f5f',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '97be13b772b059531cf2ad11e1e5cf4f',
    'sourceFile' => 'C:/Users/Sechw/Documents/MATLAB/4440/codegen/rgbtoxyz/hdlsrc/rgbtoxyz_fixpt.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7bbf39da441c173915de116746a73f48',
    'sourceFile' => 'C:/Users/Sechw/Documents/MATLAB/4440/codegen/rgbtoyiq/hdlsrc/rgbtoyiq_fixpt.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c9f3a9eafaaff1dbf72a678cdb188216',
    'sourceFile' => 'C:/Users/Sechw/Documents/MATLAB/4440/codegen/yiqtorgb/hdlsrc/yiqtorgb_fixpt.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '89e61fe015c44579d145c5d4f601aef7',
    'sourceFile' => 'C:/Users/Sechw/Documents/MATLAB/4440/codegen/hsvtorgb/hdlsrc/hsvtorgb_fixpt.v',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/14.7/ISE_DS/ISE/sysgen';
  open(RESULTS, '> C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/script_results2488276116177240668') || 
    croak 'couldn\'t open C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/script_results2488276116177240668';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/script_results2488276116177240668';
};

if ($@) {
  open(RESULTS, '> C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/script_results2488276116177240668') || 
    croak 'couldn\'t open C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/script_results2488276116177240668';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing C:/Users/Sechw/Documents/MATLAB/4440/netlist/sysgen/script_results2488276116177240668';
  exit(1);
}

exit(0);
