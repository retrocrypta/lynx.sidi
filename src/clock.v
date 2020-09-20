//-------------------------------------------------------------------------------------------------
module clock
//-------------------------------------------------------------------------------------------------
(
	input  wire i,     // 50 MHz
	output wire o,     // 48 MHz
	output wire locked
);
//-------------------------------------------------------------------------------------------------

IBUFG IBufg(.I(i), .O(ci));

DCM_SP #
(
	.CLKIN_PERIOD          (20.000),
	.CLKDV_DIVIDE          ( 2.000),
	.CLKFX_DIVIDE          (25    ),
	.CLKFX_MULTIPLY        (24    )
)
Dcm0
(
	.RST                   (1'b0),
	.DSSEN                 (1'b0),
	.PSCLK                 (1'b0),
	.PSEN                  (1'b0),
	.PSINCDEC              (1'b0),
	.CLKIN                 (ci),
	.CLKFB                 (fb),
	.CLK0                  (c0),
	.CLK90                 (),
	.CLK180                (),
	.CLK270                (),
	.CLK2X                 (),
	.CLK2X180              (),
	.CLKFX                 (co),
	.CLKFX180              (),
	.CLKDV                 (),
	.PSDONE                (),
	.LOCKED                (locked),
	.STATUS                ()
);

BUFG bufgFb(.I(c0), .O(fb));
BUFG bufgO(.I(co), .O(o));

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------
