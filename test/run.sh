#! /bin/bash

rggen \
  -c ./config.yml \
  -o out \
  --plugin rggen-verilog \
  --plugin rggen-vhdl \
  --plugin ../lib/rggen/spi.rb \
  ./uart_csr.yml
