# frozen_string_literal: true

RgGen.define_list_item_feature(:register_block, :protocol, :spi) do
  sv_rtl do
    build do
      input :sclk, {
        name: 'i_sclk', width: 1
      }
      input :ss_n, {
        name: 'i_ss_n', width: 1
      }
      input :mosi, {
        name: 'i_mosi', width: 1
      }
      output :miso, {
        name: 'o_miso', width: 1
      }
    end

    main_code :register_block, from_template: File.join(__dir__, 'spi_sv.erb')
  end

  verilog_rtl do
    build do
      input :sclk, {
        name: 'i_sclk', width: 1
      }
      input :ss_n, {
        name: 'i_ss_n', width: 1
      }
      input :mosi, {
        name: 'i_mosi', width: 1
      }
      output :miso, {
        name: 'o_miso', width: 1
      }
    end

    main_code :register_block, from_template: File.join(__dir__, 'spi_verilog.erb')
  end

  vhdl do
    build do
      input :sclk, {
        name: 'i_sclk', width: 1
      }
      input :ss_n, {
        name: 'i_ss_n', width: 1
      }
      input :mosi, {
        name: 'i_mosi', width: 1
      }
      output :miso, {
        name: 'o_miso', width: 1
      }
    end

    main_code :register_block, from_template: File.join(__dir__, 'spi_vhdl.erb')
  end
end
