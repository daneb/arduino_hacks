require 'artoo'

# Circuit and schematic here: http://arduino.cc/en/Tutorial/Blink
connection :firmata, :adaptor => :firmata, :port => '/dev/cu.usbmodem1411' #linux
# gort scan usb
# /dev/cu.usbmodem1421
# connection :firmata, :adaptor => :firmata, :port => '127.0.0.1:8023'
device :board, :driver => :device_info
device :led, :driver => :led, :pin => 13

work do
  puts "Firmware name: #{board.firmware_name}"
  puts "Firmata version: #{board.version}"

  every 1.second do
    puts "Hello World"
    led.on? ? led.off : led.on
  end
end
