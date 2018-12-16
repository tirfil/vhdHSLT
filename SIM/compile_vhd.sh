set FLAG=-v -PALL_LIB --syn-binding --ieee=synopsys --std=93c -fexplicit

ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/bitclock.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/demanchester.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/timing.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/manchester.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/lfsr17.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/timer250m.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/check17.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/leddisplay.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../VHDL/testchip.vhd
ghdl -a --work=WORK --workdir=ALL_LIB $FLAG ../TEST/tb_testchip.vhd
ghdl -e --work=WORK --workdir=ALL_LIB tb_testchip
ghdl -r --work=WORK --workdir=ALL_LIB tb_testchip --vcd=testchip.vcd
