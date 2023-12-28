# frozen_string_literal: true

RgGen.define_list_item_feature(:register_block, :protocol, :spi) do
  if component_defined?(:sv_rtl)
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
  end

  if component_defined?(:verilog_rtl)
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
  end

  if component_defined?(:vhdl)
    vhdl do
      build do
        input :sclk, { name: 'i_sclk' }
        input :ss_n, { name: 'i_ss_n' }
        input :mosi, { name: 'i_mosi' }
        output :miso, { name: 'o_miso' }
      end

      main_code :register_block, from_template: File.join(__dir__, 'spi_vhdl.erb')
    end
  end
end
