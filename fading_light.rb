require 'artoo'

# Circuit and schematic here: http://arduino.cc/en/Tutorial/Blink
connection :arduino, :adaptor => :firmata, :port => '/dev/ttyACM0' #linux
# gort scan usb
# /dev/cu.usbmodem1421
# connection :firmata, :adaptor => :firmata, :port => '127.0.0.1:8023'
device :board, :driver => :device_info
device :led, :driver => :led, :pin => 10

work do
		puts "Very slow fading light"
		fadeOn(1,5)
		fadeOff(1,5)
end

def fadeOn(increment)
	1.step(255, increment) do |i|
		led.brightness i
		sleep(0.2)
	end
end

def fadeOff(decrement)
	255.step(1, -decrement) do |i|
		led.brightness i
		sleep(0.2)
	end
end
