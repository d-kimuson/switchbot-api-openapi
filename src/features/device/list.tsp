namespace Device;

// Device List API Response
model DeviceListResponse {
  @doc("a list of physical devices")
  deviceList: PhysicalDevice[];

  @doc("a list of virtual infrared remote devices")
  infraredRemoteList: Array<RemoteDevice>;
}

// models
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

model Curtain extends BaseDevice {
  @doc("device type")
  deviceType: "Curtain";

  @doc("a list of Curtain device IDs such that the Curtain devices are being paired or grouped")
  curtainDevicesIds: Array<string>;

  @doc("determines if the open position and the close position of a device have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Curtain is paired with or grouped with another Curtain or not")
  group: boolean;

  @doc("determines if a Curtain is the master device or not when paired with or grouped with another Curtain")
  master: boolean;

  @doc("the opening direction of a Curtain")
  openDirection: string;
}

model Curtain3 extends BaseDevice {
  @doc("device type")
  deviceType: "Curtain3";

  @doc("a list of Curtain device IDs such that the Curtain devices are being paired or grouped")
  curtainDevicesIds: Array<string>;

  @doc("determines if the open position and the close position of a device have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Curtain is paired with or grouped with another Curtain or not")
  group: boolean;

  @doc("determines if a Curtain is the master device or not when paired with or grouped with another Curtain")
  master: boolean;

  @doc("the opening direction of a Curtain")
  openDirection: string;
}

model Hub extends BaseDevice {
  @doc("device type")
  deviceType: "Hub";
}

model HubPlus extends BaseDevice {
  @doc("device type")
  deviceType: "Hub Plus";
}

model HubMini extends BaseDevice {
  @doc("device type")
  deviceType: "Hub Mini";
}

model Hub2 extends BaseDevice {
  @doc("device type")
  deviceType: "Hub 2";
}

model Meter extends BaseDevice {
  @doc("device type")
  deviceType: "Meter";
}

model MeterPlus extends BaseDevice {
  @doc("device type")
  deviceType: "MeterPlus";
}

model OutdoorMeter extends BaseDevice {
  @doc("device type")
  deviceType: "WoIOSensor";
}

model Lock extends BaseDevice {
  @doc("device type")
  deviceType: "Smart Lock";

  @doc("determines if a Lock is grouped with another Lock or not")
  group: boolean;

  @doc("determines if a Lock is the master device or not when grouped with another Lock in Dual Lock mode")
  master: boolean;

  @doc("the name of the Lock group")
  groupName: string;

  @doc("	a list of Lock device IDs such that the Lock devices are being grouped in Dual Lock mode")
  lockDevicesIds: Array<string>;
}

model LockPro extends BaseDevice {
  @doc("device type")
  deviceType: "Smart Lock Pro";

  @doc("determines if a Lock is grouped with another Lock or not")
  group: boolean;

  @doc("determines if a Lock is the master device or not when grouped with another Lock in Dual Lock mode")
  master: boolean;

  @doc("the name of the Lock group")
  groupName: string;

  @doc("a list of Lock device IDs such that the Lock devices are being grouped in Dual Lock mode")
  lockDevicesIds: Array<string>;
}

model Keypad extends BaseDevice {
  @doc("device type")
  deviceType: "Keypad";

  @doc("MAC address of the Lock that the current device is paired with")
  lockDeviceId: string;

  @doc("a list of passcodes")
  keyList: Array<Passcode>;
}

model Passcode {
  @doc("passcode ID")
  id: numeric;

  @doc("name of the passcode")
  name: string;

  @doc("type of the passcode")
  type: "permanent" | "timeLimit" | "disposable" | "urgent";

  @doc("the passcode string encrypted with the developer secret key using the aes-128-cbc algorithm")
  password: string;

  @doc("an arbitrary number used for the encryption")
  iv: string;

  @doc("validity of the passcode")
  status: "normal" | "expired";

  @doc("the time when the passcode is generated")
  createTime: numeric;
}

model KeypadTouch extends BaseDevice {
  @doc("device type")
  deviceType: "Keypad Touch";

  @doc("MAC address of the Lock that the current device is paired with")
  lockDeviceId: string;

  @doc("a list of passcodes")
  keyList: Array<Passcode>;
}

model Remote extends BaseDevice {
  @doc("device type")
  deviceType: "Remote";
}

model MotionSensor extends BaseDevice {
  @doc("device type")
  deviceType: "Motion Sensor";
}

model ContactSensor extends BaseDevice {
  @doc("device type")
  deviceType: "Contact Sensor";
}

model WaterLeakDetector extends BaseDevice {
  @doc("device type")
  deviceType: "Water Detector";
}

model CeilingLight extends BaseDevice {
  @doc("device type")
  deviceType: "Ceiling Light";
}

model CeilingLightPro extends BaseDevice {
  @doc("device type")
  deviceType: "Ceiling Light Pro";
}

model PlugMiniUs extends BaseDevice {
  @doc("device type")
  deviceType: "Plug Mini (US)";
}

model PlugMiniJp extends BaseDevice {
  @doc("device type")
  deviceType: "Plug Mini (JP)";
}

model Plug extends BaseDevice {
  @doc("device type")
  deviceType: "Plug";
}

model StripLight {
  @doc("device type")
  deviceType: "Strip Light";
}

model ColorBulb {
  @doc("device type")
  deviceType: "Color Bulb";
}

model RobotVacuumCleanerS1 {
  @doc("device type")
  deviceType: "Robot Vacuum Cleaner S1";
}

model RobotVacuumCleanerS1Plus {
  @doc("device type")
  deviceType: "Robot Vacuum Cleaner S1 Plus";
}

model FloorCleaningRobotS10 {
  @doc("device type")
  deviceType: "Floor Cleaning Robot S10";
}

model Humidifier {
  @doc("device type")
  deviceType: "Humidifier";
}

model IndoorCam {
  @doc("device type")
  deviceType: "Indoor Cam";
}

model PanCam {
  @doc("device type")
  deviceType: "Pan Cam";
}

model TiltCam {
  @doc("device type")
  deviceType: "Tilt Cam";
}

model BlindTilt {
  @doc("device type")
  deviceType: "Blind Tilt";

  @doc("a list of Blind Tilt device IDs such that the Blind Tilt devices are being paired or grouped")
  blindTiltDevicesIds: Array<string>;

  @doc("determines if the open and the closed positions have been properly calibrated or not")
  calibrate: boolean;

  @doc("determines if a Blind Tilt device is paired with or grouped with one or more devices of the same type or not")
  group: boolean;

  @doc("determines if a Blind Tilt device is the master device or not when paired with or grouped with one or more devices of the same type")
  master: boolean;

  @doc("the opening direction of a Blind Tilt device")
  direction: string;

  @doc("the current position, 0-100")
  slidePosition: numeric;
}

model BatteryCirculatorFan {
  @doc("device type")
  deviceType: "Battery Circulator Fan";
}

alias PhysicalDevice =
  | Hub
  | HubPlus
  | HubMini
  | Bot
  | Curtain
  | Plug
  | Meter
  | MotionSensor
  | ContactSensor
  | ColorBulb
  | Humidifier
  | StripLight
  | PlugMiniUs
  | PlugMiniJp
  | Lock
  | MeterPlus
  | RobotVacuumCleanerS1
  | RobotVacuumCleanerS1Plus
  | Keypad
  | KeypadTouch
  | CeilingLight
  | CeilingLightPro
  | BlindTilt
  | Hub2
  | OutdoorMeter
  | BatteryCirculatorFan
  | Curtain3
  | LockPro
  | FloorCleaningRobotS10
  | WaterLeakDetector;

model RemoteDevice {
  @doc("device ID")
  deviceId: string;

  @doc("device name")
  deviceName: string;

  @doc("device type")
  remoteType:
    | "Air Conditioner"
    | "TV"
    | "Light"
    | "Streamer"
    | "Set Top Box"
    | "DVD Player"
    | "Fan"
    | "Projector"
    | "Camera"
    | "Air Purifier"
    | "Speaker"
    | "Water Heater"
    | "Robot Vacuum Cleaner"
    | "IPTV/Streamer"
    | "Others";

  @doc("remote device's parent Hub ID")
  hubDeviceId: string;
}
