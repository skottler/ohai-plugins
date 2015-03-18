Ohai.plugin(:Trim) do
  # This ohai plugin provides data about TRIM support on each underlying block
  # device available on the system. Its functionality is rather simple - it
  # iterates over each physical device, ignoring partitions, and then runs
  # hdparm to find the drives' capabilities, finally grepping for TRIM support.

  provides "block_device/trim"
  depends "block_device"

  collect_data(:default) do
    devices = shell_out("ls /dev/sd[a-z]").stdout.lines
    if devices
      devices.each do |device|
        device = device.chomp
        so = shell_out("hdparm -I #{device} | grep 'TRIM supported'")
        block_device[device.gsub(/.*\//, '').to_sym][:trim] = so.exitstatus == 0 ? true : false
      end

      block_device
    end
  end
end
