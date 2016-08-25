class CarsController < ApplicationController
  def create
    @car = Car.new(params[:make],params[:year].to_i)
    cookies[:car] = @car.to_yaml
  end

  def accelerate
    # storing the car object in a cookies, and then in a YAML object
    @car = YAML.load(cookies[:car])
    @car.accelerate
    # parsing car object so DOM can read it
    cookies[:car] = @car.to_yaml
    # does not change the page except for speed
    render 'create.html.erb'
  end

  def brake
    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  # links to the lights_switch function inside car
  def lights_switch
    @car = YAML.load(cookies[:car])
    # runs the function inside the class car
    @car.lights_switch
    cookies[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def parking_brake
    @car = YAML.load(cookies[:car])
    if @car.speed == 0
    @car.parking_brake = params[:parking_brake]
    cookies[:car] = @car.to_yaml
  end
  render 'create.html.erb'
  end

  def simulate
  end
end
