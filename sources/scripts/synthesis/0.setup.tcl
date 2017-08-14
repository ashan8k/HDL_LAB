set DC_LIB_DIR		"/cad/synopsys/libs/TSMC_40nm/digital/Front_End/timing_power_noise/CCS"
set SYNOPSYS_HOME	"/cad/synopsys/tools/syn_vE-2010.12-SP1"
set DC_LIB_NAME		"TSMC 40nm LP"

set search_path			[concat $search_path				\
								$DC_LIB_DIR					\
								$SYNOPSYS_HOME/libraries/syn		\
								/home/vhdlp19/ASHAN/hdl_repo/sources/rtl]				  
                     # Give path of RTL files here

set target_library		[concat $DC_LIB_DIR/tcbn45gsbwp12t_200a/tcbn45gsbwp12ttc_ccs.db]

set symbol_library		""

set synthetic_library	[concat dw_foundation.sldb	\
								standard.sldb		\
						]

set link_library		[concat	*					\
								$target_library 	\
								$synthetic_library	\
								\
						]
					
						
set designer "Ashan group 3"

set_host_options -max_cores 8

# Define aliases
alias h history
alias rc report_constraint -all_violators
