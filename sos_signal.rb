require 'artoo'

# DFRobot Project 2 - SOS Beacon
connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem1421'

# Board
device :board, :driver => :device_info

# LED # Green Jumper connected
device :led, :driver => :led, :pin => 10

work do
  every 30.second do
    # S
    for i in (1..6)
      led.on? ? led.off : led.on
      sleep 0.5
    end

    # O
    for i in (1..6)
      led.on? ? led.off : led.on
      sleep 1
    end

    # S
    for i in (1..6)
      led.on? ? led.off : led.on
      sleep 0.5
    end
  end
end
