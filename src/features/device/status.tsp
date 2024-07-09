namespace DeviceStatus;

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

alias Curtain3Status = CurtainStatus;

model HubRelatedStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Hub" | "Hub Plus" | "Hub Mini" | "Hub 2";

  @doc("the current firmware version, e.g. V3.1")
  version: string;
}

model MeterStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Meter";

  @doc("temperature value of the environment where the device is located")
  temperature: numeric;

  @doc("humidity level in the environment where the device is located")
  humidity: numeric;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V2.5")
  version: string;
}

model MeterPlusStatus extends OmitProperties<MeterStatus, "deviceType"> {
  @doc("device type")
  deviceType: "MeterPlus";

  @doc("luminance value of the environment where the device is located")
  luminance: numeric;
}

model MotionSensorStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "MotionSensor";

  @doc("detected motion status")
  motionDetected: boolean;

  @doc("detected movement count")
  movementCount: numeric;

  @doc("luminance value of the environment where the device is located")
  luminance: numeric;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V1.8")
  version: string;
}

model ContactSensorStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "ContactSensor";

  @doc("detected open status")
  open: boolean;

  @doc("detected move status")
  moveDetected: boolean;

  @doc("luminance value of the environment where the device is located")
  luminance: numeric;

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V1.3")
  version: string;
}

model LockStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Lock";

  @doc("determines if the device is locked")
  lockState: "locked" | "unlocked";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V1.7")
  version: string;
}

model PlugStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Plug";

  @doc("determines if the plug is on or off")
  powerState: "on" | "off";

  @doc("the current firmware version, e.g. V2.2")
  version: string;
}

model RemoteStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Remote";

  @doc("the current firmware version, e.g. V3.0")
  version: string;
}

model ThermostatStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Thermostat";

  @doc("current temperature setting")
  temperatureSetting: numeric;

  @doc("current mode of the thermostat")
  mode: "heat" | "cool" | "auto" | "off";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V4.5")
  version: string;
}

model CameraStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Camera";

  @doc("current status of the camera")
  status: "Online" | "Offline";

  @doc("field of view of the camera in degrees")
  fieldOfView: numeric;

  @doc("the current firmware version, e.g. V5.1")
  version: string;
}

model HumidifierStatus extends BaseDeviceStatus {
  @doc("device type")
  deviceType: "Humidifier";

  @doc("current humidity level setting")
  humidityLevel: numeric;

  @doc("current power state of the humidifier")
  powerState: "on" | "off";

  @doc("the current battery level, 0-100")
  @minValue(0)
  @maxValue(100)
  battery: numeric;

  @doc("the current firmware version, e.g. V2.9")
  version: string;
}

// Union of all device status models
alias DeviceStatus =
  | BotStatus
  | CurtainStatus
  | Curtain3Status
  | HubRelatedStatus
  | MeterStatus
  | MeterPlusStatus
  | MotionSensorStatus
  | ContactSensorStatus
  | LockStatus
  | PlugStatus
  | RemoteStatus
  | ThermostatStatus
  | CameraStatus
  | HumidifierStatus;
