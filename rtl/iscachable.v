////////////////////////////////////////////////////////////////////////////////
//
// Filename:	./iscachable.v
//
// Project:	ZipVersa, Versa Brd implementation using ZipCPU infrastructure
//
// DO NOT EDIT THIS FILE!
// Computer Generated: This file is computer generated by AUTOFPGA. DO NOT EDIT.
// DO NOT EDIT THIS FILE!
//
// CmdLine:	autofpga autofpga -d -o . allclocks.txt global.txt dlyarbiter.txt version.txt buserr.txt pic.txt pwrcount.txt spio.txt gpio.txt rtclight.txt wbuconsole.txt bkram.txt flash.txt zipmaster.txt netclockctr.txt mdio1.txt enet.txt enetscope.txt flashscope.txt mem_flash_bkram.txt mem_bkram_only.txt
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2019, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype none
//
module iscachable(i_addr, o_cachable);
	localparam		AW = 23;
	input	wire	[AW-1:0]	i_addr;
	output	reg			o_cachable;

	always @(*)
	begin
		o_cachable = 1'b0;
		// Bus master: zip
		// Bus master: wb
		// Bus master: wb_sio
		// bkram
		if ((i_addr[22:0] & 23'h7c0000) == 23'h280000)
			o_cachable = 1'b1;
		// flash
		if ((i_addr[22:0] & 23'h400000) == 23'h400000)
			o_cachable = 1'b1;
	end

endmodule
