namespace Device;

@discriminator("deviceType")
model BaseDevice {
  @doc("device ID")
  deviceId: string;

  @doc("device name")
  deviceName: string;

  @doc("determines if Cloud Service is enabled or not for the current device")
  enableCloudService: boolean;

  @doc("device's parent Hub ID")
  hubDeviceId: string;
}

model Bot extends BaseDevice {
  @doc("device type")
  deviceType: "Bot";
}

model BaseCurtain extends BaseDevice {
  @doc("Array a list of Curtain device IDs such that the Curtain devices are being paired or grouped")
  curtainDevicesIds: string[];

  @doc("determines if the open position and the close position of a device have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Curtain is paired with or grouped with another Curtain or not")
  group: boolean;

  @doc("determines if a Curtain is the master device or not when paired with or grouped with another Curtain")
  master: boolean;

  @doc("the opening direction of a Curtain")
  openDirection: string;
}

model Curtain extends BaseCurtain {
  @doc("device type")
  deviceType: "Curtain";
}

model Curtain3 extends BaseCurtain {
  @doc("device type")
  deviceType: "Curtain3";
}

model HubRelated extends BaseDevice {
  @doc("device type")
  deviceType: "Hub" | "Hub Plus" | "Hub Mini" | "Hub 2";
}

model Meter extends BaseDevice {
  @doc("device type")
  deviceType: "Meter";

  @doc("temperature value of the environment where the device is located")
  temperature: numeric;

  @doc("humidity level in the environment where the device is located")
  humidity: numeric;
}

model MeterPlus extends BaseDevice {
  @doc("device type")
  deviceType: "MeterPlus";

  @doc("temperature value of the environment where the device is located")
  temperature: numeric;

  @doc("humidity level in the environment where the device is located")
  humidity: numeric;

  @doc("luminance value of the environment where the device is located")
  luminance: numeric;
}

model MotionSensor extends BaseDevice {
  @doc("device type")
  deviceType: "MotionSensor";

  @doc("detected motion status")
  motionDetected: boolean;

  @doc("detected movement count")
  movementCount: numeric;

  @doc("luminance value of the environment where the device is located")
  luminance: numeric;
}

model ContactSensor extends BaseDevice {
  @doc("device type")
  deviceType: "ContactSensor";

  @doc("detected open status")
  open: boolean;

  @doc("detected move status")
  moveDetected: boolean;

  @doc("luminance value of the environment where the device is located")
  luminance: numeric;
}

model Lock extends BaseDevice {
  @doc("device type")
  deviceType: "Lock";

  @doc("determines if the device is locked")
  lockState: "locked" | "unlocked";
}

model Plug extends BaseDevice {
  @doc("device type")
  deviceType: "Plug";

  @doc("determines if the plug is on or off")
  powerState: "on" | "off";
}

model Remote extends BaseDevice {
  @doc("device type")
  deviceType: "Remote";
}

model Thermostat extends BaseDevice {
  @doc("device type")
  deviceType: "Thermostat";

  @doc("current temperature setting")
  temperatureSetting: numeric;

  @doc("current mode of the thermostat")
  mode: "heat" | "cool" | "auto" | "off";
}

model Camera extends BaseDevice {
  @doc("device type")
  deviceType: "Camera";

  @doc("current status of the camera")
  status: "Online" | "Offline";

  @doc("field of view of the camera in degrees")
  fieldOfView: numeric;
}

model Humidifier extends BaseDevice {
  @doc("device type")
  deviceType: "Humidifier";

  @doc("current humidity level setting")
  humidityLevel: numeric;

  @doc("current power state of the humidifier")
  powerState: "on" | "off";
}

// Device List Response
model DeviceListResponse {
  @doc("List of devices")
  devices: Device[];
}

// Union of all device models
alias Device =
  | Bot
  | Curtain
  | Curtain3
  | HubRelated
  | Meter
  | MeterPlus
  | MotionSensor
  | ContactSensor
  | Lock
  | Plug
  | Remote
  | Thermostat
  | Camera
  | Humidifier;
