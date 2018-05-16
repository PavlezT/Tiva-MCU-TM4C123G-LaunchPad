################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
XPT2046.obj: ../XPT2046.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156" --include_path="C:/ti/URTouch/URTouch" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers" --advice:power="all" -g --c89 --c++03 --gen_acp_raw --gcc --define=ccs="ccs" --define=PART_TM4C123GH6PM --define=TARGET_IS_TM4C123_RB1 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="XPT2046.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

blinky.obj: ../blinky.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156" --include_path="C:/ti/URTouch/URTouch" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers" --advice:power="all" -g --c89 --c++03 --gen_acp_raw --gcc --define=ccs="ccs" --define=PART_TM4C123GH6PM --define=TARGET_IS_TM4C123_RB1 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="blinky.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

rgb.obj: C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers/rgb.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156" --include_path="C:/ti/URTouch/URTouch" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers" --advice:power="all" -g --c89 --c++03 --gen_acp_raw --gcc --define=ccs="ccs" --define=PART_TM4C123GH6PM --define=TARGET_IS_TM4C123_RB1 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="rgb.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

ssd1289.obj: ../ssd1289.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156" --include_path="C:/ti/URTouch/URTouch" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers" --advice:power="all" -g --c89 --c++03 --gen_acp_raw --gcc --define=ccs="ccs" --define=PART_TM4C123GH6PM --define=TARGET_IS_TM4C123_RB1 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="ssd1289.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

startup_ccs.obj: ../startup_ccs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156" --include_path="C:/ti/URTouch/URTouch" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers" --advice:power="all" -g --c89 --c++03 --gen_acp_raw --gcc --define=ccs="ccs" --define=PART_TM4C123GH6PM --define=TARGET_IS_TM4C123_RB1 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="startup_ccs.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

tm4c123gh6pm_startup_ccs.obj: ../tm4c123gh6pm_startup_ccs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-arm_5.2.6/include" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156" --include_path="C:/ti/URTouch/URTouch" --include_path="C:/ti/TivaWare_C_Series-2.1.3.156/examples/boards/ek-tm4c123gxl-boost-dlptrf7970abp/drivers" --advice:power="all" -g --c89 --c++03 --gen_acp_raw --gcc --define=ccs="ccs" --define=PART_TM4C123GH6PM --define=TARGET_IS_TM4C123_RB1 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="tm4c123gh6pm_startup_ccs.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


