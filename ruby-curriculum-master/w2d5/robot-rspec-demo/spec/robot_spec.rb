require 'rspec'
require 'robot.rb'

# Assessments are for your benefit; they let us keep track of student
# progress, areas students need help in, etc. Especially if you are
# struggling, assessments help us know to figure that out.

# This assignment is intended to take ~1hr to complete. After an hour
# record how much you have finished by making a copy of your code at
# that point. Then take additional time to complete the assignment.
# Record how many hours this takes.

# Make sure to record both where you were after 1hr, and how long it
# takes to complete. It's really important for us to have accurate
# information where everyone is, so that we can pair people
# appropriately, know who to work closely with in the first couple
# weeks, etc.

# For the assignment, you'll need to know:
# * How to create a class
# * How to create instance variables
# * How to synthesize readers/accessors (`attr_reader`, `attr_accessor`)
# * How to write a method
# * How to use if/else
# * How to raise an exception
# * How to write your own `initialize` method
#   * How to use `super` to call a parent class' `initialize` method
# * How to use inheritance to extend a class

describe Robot do
  subject(:robot) { Robot.new }

  describe "#position" do
    it "starts at the origin" do
      expect(robot.position).to eq([0, 0])
    end
  end

  describe "move methods" do
    it "moves left" do
      robot.move_left
      expect(robot.position).to eq([-1, 0])
    end

    it "moves right" do
      robot.move_right
      expect(robot.position).to eq([1, 0])
    end

    it "moves up" do
      robot.move_up
      expect(robot.position).to eq([0, 1])
    end

    it "moves down" do
      robot.move_down
      expect(robot.position).to eq([0, -1])
    end
  end
end

describe Item do
  subject(:item) do
    Item.new("rubies", 20)
  end

  it "initializes with a name and weight" do
    expect(item.name).to eq("rubies")
    expect(item.weight).to eq(20)
  end
end

describe Robot do
  subject(:robot) { Robot.new }
  let(:item1) { double("item", :weight => 10) }
  let(:item2) { double("item2", :weight => 30) }

  let(:light_item) { double("heavy_item", :weight => 1) }
  let(:max_weight_item) { double("max_weight_item", :weight => 250) }

  describe "#items" do
    it "starts as an empty array" do
      expect(robot.items).to eq([])
    end
  end

  describe "#pick_up" do
    it "adds item to items" do
      robot.pick_up(item1)
      expect(robot.items).to include(item1)
    end
  end

  describe "#items_weight" do
    it "starts with a weight of zero" do
      expect(robot.items_weight).to eq(0)
    end

    it "should sum items weights" do
      robot.pick_up(item1)
      robot.pick_up(item2)

      expect(robot.items_weight).to eq(40)
    end
  end

  describe "#pick_up" do
    it "should not add item past maximum weight of 250" do
      robot.pick_up(max_weight_item)

      expect do
        robot.pick_up(light_item)
      end.to raise_error(ArgumentError)
    end
  end
end

describe Robot do
  subject(:robot) { Robot.new }

  describe "#health" do
    it "starts at 100" do
      expect(robot.health).to eq(100)
    end
  end

  describe "#wound" do
    it "decreases health" do
      robot.wound(20)
      expect(robot.health).to eq(80)
    end

    it "doesn't decrease health below 0" do
      robot.wound(150)
      expect(robot.health).to eq(0)
    end
  end

  describe "#heal" do
    it "increases health" do
      robot.wound(40)
      robot.heal(20)
      expect(robot.health).to eq(80)
    end

    it "doesn't increase health over 100" do
      robot.heal(10)
      expect(robot.health).to eq(100)
    end
  end

  describe "#attack" do
    it "wounds other robot with weak default attack" do
      robot2 = double("robot2")
      expect(robot2).to receive(:wound).with(5)

      robot.attack(robot2)
    end
  end
end

describe Bolts do
  subject(:bolts) { Bolts.new }

  it "initializes as an Item with the correct name and weight" do
    expect(bolts).to be_an(Item)
    expect(bolts.name).to eq("bolts")
    expect(bolts.weight).to eq(25)
  end

  describe "#feed" do
    it "heals the robots health 25pts" do
      robot = double("robot")
      expect(robot).to receive(:heal).with(25)

      bolts.feed(robot)
    end
  end
end

describe Weapon do
  subject(:weapon) { Weapon.new("power_shock", 10, 45) }

  it "initializes as an Item with the correct name, weight, and damage" do
    expect(weapon).to be_an(Item)
    expect(weapon.name).to eq("power_shock")
    expect(weapon.weight).to eq(10)
    expect(weapon.damage).to eq(45)
  end

  describe "#hit" do
    let(:robot) { double("robot") }

    it "hurts robot" do
      expect(robot).to receive(:wound).with(45)
      weapon.hit(robot)
    end
  end
end

describe Laser do
  subject(:laser) { Laser.new }

  it "initializes as a Weapon with the correct name, weight, and damage" do
    expect(laser).to be_a(Weapon)
    expect(laser.name).to eq("laser")
    expect(laser.weight).to eq(125)
    expect(laser.damage).to eq(25)
  end
end

describe PlasmaCannon do
  subject(:plasma_cannon) { PlasmaCannon.new }

  it "initializes as a Weapon with the correct name, weight, and damage" do
    expect(plasma_cannon).to be_a(Weapon)
    expect(plasma_cannon.name).to eq("plasma_cannon")
    expect(plasma_cannon.weight).to eq(200)
    expect(plasma_cannon.damage).to eq(55)
  end
end

describe Robot do
  subject(:robot) { Robot.new }

  describe "#equipped_weapon" do
    it "starts with no weapon equipped" do
      expect(robot.equipped_weapon).to eq(nil)
    end

    it "sets equipped weapon" do
      weapon = double("weapon")

      robot.equipped_weapon = weapon
      expect(robot.equipped_weapon).to eq(weapon)
    end
  end

  describe "#attack" do
    let(:robot2) { double("robot2") }
    let(:weapon) { double("weapon") }

    it "uses the equipped weapon in attack" do
      robot.equipped_weapon = weapon

      expect(weapon).to receive(:hit).with(robot2)
      robot.attack(robot2)
    end
  end
end
