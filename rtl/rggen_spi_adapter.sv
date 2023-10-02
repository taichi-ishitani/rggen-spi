module rggen_spi_adapter
  import  rggen_rtl_pkg::*;
#(
  parameter int                     ADDRESS_WIDTH       = 8,
  parameter int                     LOCAL_ADDRESS_WIDTH = 8,
  parameter int                     BUS_WIDTH           = 32,
  parameter int                     REGISTERS           = 1,
  parameter bit                     PRE_DECODE          = 0,
  parameter bit [ADDRESS_WIDTH-1:0] BASE_ADDRESS        = '0,
  parameter int                     BYTE_SIZE           = 256,
  parameter bit                     ERROR_STATUS        = 0,
  parameter bit [BUS_WIDTH-1:0]     DEFAULT_READ_DATA   = '0,
  parameter bit                     INSERT_SLICER       = 0
)(
  input   logic           i_clk,
  input   logic           i_rst_n,
  input   logic           i_sclk,
  input   logic           i_ss_n,
  input   logic           i_mosi,
  output  logic           o_miso,
  rggen_register_if.host  register_if[REGISTERS]
);
  rggen_bus_if #(ADDRESS_WIDTH, BUS_WIDTH)  bus_if();

  //
  //  Implement SPI -> rggen_bus_if conversion logic
  //

  rggen_adapter_common #(
    .ADDRESS_WIDTH        (ADDRESS_WIDTH        ),
    .LOCAL_ADDRESS_WIDTH  (LOCAL_ADDRESS_WIDTH  ),
    .BUS_WIDTH            (BUS_WIDTH            ),
    .REGISTERS            (REGISTERS            ),
    .PRE_DECODE           (PRE_DECODE           ),
    .BASE_ADDRESS         (BASE_ADDRESS         ),
    .BYTE_SIZE            (BYTE_SIZE            ),
    .ERROR_STATUS         (ERROR_STATUS         ),
    .DEFAULT_READ_DATA    (DEFAULT_READ_DATA    ),
    .INSERT_SLICER        (INSERT_SLICER        )
  ) u_adapter_common (
    .i_clk        (i_clk        ),
    .i_rst_n      (i_rst_n      ),
    .bus_if       (bus_if       ),
    .register_if  (register_if  )
  );
endmodule
