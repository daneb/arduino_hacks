require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/ttyACM0' #linux
# gort scan usb
# /dev/cu.usbmodem1421
# connection :firmata, :adaptor => :firmata, :port => '127.0.0.1:8023'
device :board, :driver => :device_info
device :red_led, :driver => :led, :pin => 9
device :green_led, :driver => :led, :pin => 10
device :blue_led, :driver => :led, :pin => 11

# There is no constrain method in Artoo
work do
	every 20.second do
		colorRGB(rand(255), rand(255), rand(255))
	end
end

def colorRGB(red, green, blue)
	red_led.brightness(red)
	green_led.brightness(green)
	blue_led.brightness(blue)
end
