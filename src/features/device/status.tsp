namespace DeviceStatus;

// Device List API Response
alias DeviceStatusResponse = PhysicalDeviceStatus;

alias PhysicalDeviceStatus =
  | BotStatus
  | PlugStatus
  | CurtainStatus
  | MeterStatus
  | MotionSensorStatus
  | ContactSensorStatus
  | ColorBulbStatus
  | HumidifierStatus
  | StripLightStatus
  | LockStatus
  | PlugMiniUsStatus
  | PlugMiniJpStatus
  | RobotVacuumCleanerS1Status
  | RobotVacuumCleanerS1PlusStatus
  | KeypadStatus
  | KeypadTouchStatus
  | CeilingLightStatus
  | CeilingLightProStatus
  | Hub2Status
  | OutdoorMeterStatus
  | BatteryCirculatorFanStatus
  | LockProStatus
  | FloorCleaningRobotS10Status
  | WaterLeakDetectorStatus;

// model
@discriminator("deviceType")
model BaseDeviceStatus {
  @doc("device ID")
  deviceId: string;

  @doc("device's parent Hub ID")
  hubDeviceId: string;
}

model BotStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Bot";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V6.3")
  version: string;

  @doc("pressMode, switchMode, or customizeMode")
  deviceMode: "pressMode" | "switchMode" | "customizeMode";
}

model CurtainStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Curtain";

  @doc("determines if the open position and the close position of a device have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Curtain is paired with or grouped with another Curtain or not")
  group: boolean;

  @doc("determines if a Curtain is moving or not")
  moving: boolean;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("the percentage of the distance between the calibrated open position and closed position that Curtain has traversed")
  slidePosition: string;
}

model Curtain3Status extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Curtain3";

  @doc("determines if the open position and the close position of a device have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Curtain is paired with or grouped with another Curtain or not")
  group: boolean;

  @doc("determines if a Curtain is moving or not")
  moving: boolean;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("the percentage of the distance between the calibrated open position and closed position that Curtain has traversed")
  slidePosition: string;
}

model MeterStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Meter";

  @doc("temperature in celsius")
  temperature: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("humidity percentage")
  humidity: numeric;
}

model MeterPlusStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "MeterPlus";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("temperature in celsius")
  temperature: numeric;

  @doc("humidity percentage")
  humidity: numeric;
}

model OutdoorMeterStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "WoIOSensor";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("temperature in celsius")
  temperature: numeric;

  @doc("humidity percentage")
  humidity: numeric;
}

model LockStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Smart Lock";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("determines if locked or not")
  lockState: "lock" | "unlock";

  @doc("determines if the door is closed or not")
  doorState: "open" | "close";

  @doc("determines if Lock has been calibrated or not")
  calibrate: boolean;
}

model LockProStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Smart Lock Pro";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("determines if locked or not")
  lockState: "lock" | "unlock";

  @doc("determines if the door is closed or not")
  doorState: "open" | "close";

  @doc("determines if Lock has been calibrated or not")
  calibrate: boolean;
}

model KeypadStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Keypad";
}

model KeypadTouchStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Keypad Touch";
}

model MotionSensorStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Motion Sensor";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("determines if motion is detected")
  moveDetected: boolean;

  @doc("the ambient brightness picked up by the sensor. bright or dim")
  brightness: string;
}

model ContactSensorStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Contact Sensor";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("determines if motion is detected")
  moveDetected: boolean;

  @doc("the open state of the sensor. open, close, or timeOutNotClose")
  openState: "open" | "close" | "timeOutNotClose";

  @doc("the ambient brightness picked up by the sensor. bright or dim")
  brightness: "bright" | "dim";
}

model WaterLeakDetectorStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Water Detector";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("0, dry. 1, leak detected")
  status: 0 /* dry */ | 1 /* detected */;
}

model CeilingLightStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Ceiling Light";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("the brightness value, range from 1 to 100")
  @minValue(1)
  @maxValue(100)
  brightness: numeric;

  @doc("the color temperature value, range from 2700 to 6500")
  @minValue(2700)
  @maxValue(6500)
  colorTemperature: numeric;
}

model CeilingLightProStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Ceiling Light Pro";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("the brightness value, range from 1 to 100")
  @minValue(1)
  @maxValue(100)
  brightness: numeric;

  @doc("the color temperature value, range from 2700 to 6500")
  @minValue(2700)
  @maxValue(6500)
  colorTemperature: numeric;
}

model PlugMiniUsStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Plug Mini (US)";

  @doc("the voltage of the device, measured in Volt")
  voltage: numeric;

  @doc("the current BLE and Wi-Fi firmware version, e.g. V3.1-6.3")
  version: string;

  @doc("the power consumed in a day, measured in Watts")
  weight: numeric;

  @doc("the duration that the device has been used during a day, measured in minutes")
  electricityOfDay: numeric;

  @doc("the current of the device at the moment, measured in Amp")
  electricCurrent: numeric;
}

model PlugMiniJpStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Plug Mini (JP)";

  @doc("the voltage of the device, measured in Volt")
  voltage: numeric;

  @doc("the current BLE and Wi-Fi firmware version, e.g. V3.1-6.3")
  version: string;

  @doc("the power consumed in a day, measured in Watts")
  weight: numeric;

  @doc("the duration that the device has been used during a day, measured in minutes")
  electricityOfDay: numeric;

  @doc("the current of the device at the moment, measured in Amp")
  electricCurrent: numeric;
}

model PlugStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Plug";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("the current Wi-Fi firmware version, e.g. V4.2")
  version: string;

  @doc("device's parent Hub ID. 000000000000 when the device itself is a Hub or it is connected through Wi-Fi.")
  hubDeviceId: string;
}

model StripLightStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Strip Light";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("the current BLE and Wi-Fi firmware version, e.g. V3.1-6.3")
  version: string;

  @doc("the brightness value, range from 1 to 100")
  @minValue(1)
  @maxValue(100)
  brightness: numeric;

  @doc("the color value, RGB '255:255:255'")
  color: string;
}

model ColorBulbStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Color Bulb";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("the brightness value, range from 1 to 100")
  @minValue(1)
  @maxValue(100)
  brightness: numeric;

  @doc("the current BLE and Wi-Fi firmware version, e.g. V3.1-6.3")
  version: string;

  @doc("the color value, RGB '255:255:255'")
  color: string;

  @doc("the color temperature value, range from 2700 to 6500")
  @minValue(2700)
  @maxValue(6500)
  colorTemperature: numeric;
}

model RobotVacuumCleanerS1Status extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Robot Vacuum Cleaner S1";

  @doc("the working status of the device. StandBy, Clearing, Paused, GotoChargeBase, Charging, ChargeDone, Dormant, InTrouble, InRemoteControl, or InDustCollecting")
  workingStatus:
    | "StandBy"
    | "Clearing"
    | "Paused"
    | "GotoChargeBase"
    | "Charging"
    | "ChargeDone"
    | "Dormant"
    | "InTrouble"
    | "InRemoteControl"
    | "InDustCollecting";

  @doc("the connection status of the device. online or offline")
  onlineStatus: "online" | "offline";

  @doc("the current battery level")
  @minValue(0)
  @maxValue(100)
  battery: numeric;
}

model RobotVacuumCleanerS1PlusStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Robot Vacuum Cleaner S1 Plus";

  @doc("the working status of the device. StandBy, Clearing, Paused, GotoChargeBase, Charging, ChargeDone, Dormant, InTrouble, InRemoteControl, or InDustCollecting")
  workingStatus:
    | "StandBy"
    | "Clearing"
    | "Paused"
    | "GotoChargeBase"
    | "Charging"
    | "ChargeDone"
    | "Dormant"
    | "InTrouble"
    | "InRemoteControl"
    | "InDustCollecting";

  @doc("the connection status of the device. online or offline")
  onlineStatus: "online" | "offline";

  @doc("the current battery level")
  @minValue(0)
  @maxValue(100)
  battery: numeric;
}

model FloorCleaningRobotS10Status extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Floor Cleaning Robot S10";

  @doc("the working status of the device. StandBy, Clearing, Paused, GotoChargeBase, Charging, ChargeDone, Dormant, InTrouble, InRemoteControl, or InDustCollecting")
  workingStatus:
    | "StandBy"
    | "Clearing"
    | "Paused"
    | "GotoChargeBase"
    | "Charging"
    | "ChargeDone"
    | "Dormant"
    | "InTrouble"
    | "InRemoteControl"
    | "InDustCollecting";

  @doc("the connection status of the device. online or offline")
  onlineStatus: "online" | "offline";

  @doc("the current battery level")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current battery level")
  @minValue(0)
  @maxValue(100)
  waterBaseBattery: numeric;

  @doc("the current task in progress. standBy, explore, cleanAll, cleanArea, cleanRoom, fillWater, deepWashing, backToCharge, markingWaterBase, drying, collectDust, remoteControl, cleanWithExplorer, fillWaterForHumi, markingHumi")
  taskType:
    | "standBy"
    | "explore"
    | "cleanAll"
    | "cleanArea"
    | "cleanRoom"
    | "fillWater"
    | "deepWashing"
    | "backToCharge"
    | "markingWaterBase"
    | "drying"
    | "collectDust"
    | "remoteControl"
    | "cleanWithExplorer"
    | "fillWaterForHumi"
    | "markingHumi";
}

model HumidifierStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Humidifier";

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("humidity percentage")
  humidity: numeric;

  @doc("temperature in celsius")
  temperature: numeric;

  @doc("atomization efficiency percentage")
  nebulizationEfficiency: numeric;

  @doc("determines if a Humidifier is in Auto Mode or not")
  auto: boolean;

  @doc("determines if a Humidifier's safety lock is on or not")
  childLock: boolean;

  @doc("determines if a Humidifier is muted or not")
  sound: boolean;

  @doc("determines if the water tank is empty or not")
  lackWater: boolean;
}

model BlindTiltStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Blind Tilt";

  @doc("determines if the open and the closed positions have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Blind Tilt device is paired with or grouped with one or more devices of the same type or not")
  group: boolean;

  @doc("determines if the device is moving or not")
  moving: boolean;

  @doc("the opening direction of a Blind Tilt device")
  direction: string;

  @doc("the current position, 0-100")
  slidePosition: numeric;
}

model Hub2Status extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Hub 2";

  @doc("temperature in celsius")
  temperature: numeric;

  @doc("the level of illuminance of the ambience light, 1~20")
  lightLevel: numeric;

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("humidity percentage")
  humidity: numeric;
}

model BatteryCirculatorFanStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Battery Circulator Fan";

  @doc("device name")
  deviceName: string;

  @doc("fan mode. direct mode: direct; natural mode: natural; sleep mode: sleep; ultra quiet mode: baby")
  mode: "direct" | "natural" | "sleep" | "baby";

  @doc("the current firmware version, e.g. V4.2")
  version: string;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("ON/OFF state")
  power: "ON" | "OFF";

  @doc("set nightlight status. turn off: off; mode 1: 1; mode 2: 2")
  nightStatus: 0 | 1 | 2;

  @doc("set horizontal oscillation. turn on: on; turn off: off")
  oscillation: "on" | "off";

  @doc("set vertical oscillation. turn on: on; turn off: off")
  verticalOscillation: "on" | "off";

  @doc("battery charge status. charging or uncharged")
  chargingStatus: "charging" | "uncharged";

  @doc("fan speed. 1~100")
  @minValue(1)
  @maxValue(100)
  fanSpeed: numeric;
}
