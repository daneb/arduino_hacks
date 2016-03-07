require 'artoo'

# DFRobot Project 2 - SOS Beacon
connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem1411'

# Board
device :board, :driver => :device_info

carRed = 12
carYellow = 11
carGreen = 10
button = 9
pedRed = 8    # Configuration for pedestrians
pedGreen = 7
crossTime = 5
changeTime = 0

device :green_car, :driver => :led, :pin => carGreen
device :yellow_car, :driver => :led, :pin => carYellow
device :red_car, :driver => :led, :pin => carRed
device :ped_red, :driver => :led, :pin => pedRed
device :ped_green, :driver => :led, :pin => pedGreen
device :my_button, :driver => :button, :pin => button

def change_lights
  green_car.off
  yellow_car.on
  sleep 2

  yellow_car.off
  red_car.on
  sleep 1

  ped_red.off
  ped_green.on

  sleep 5

  for i in 1..10
  	ped_green.off
  	sleep 0.2
  	ped_green.on
  	sleep 0.2
  end

  ped_green.off
  ped_red.on
  sleep 0.5

  red_car.off
  yellow_car.on
  sleep 1

  yellow_car.off
  green_car.on

end

work do
  green_car.on
  ped_red.off
  every 5.second do
    puts "Hello Dane"
    on my_button, :push => proc { change_lights }
  end
end
