import "../../lib/shared-response.tsp";

namespace DeviceControl;

model BotCommand {
  commandType: "command";
  command: "turnOff" | "turnOn" | "press";
}

alias CurtainCommand = {
  commandType: "command";
  command: "setPosition";

  @doc("mode: 0 (Performance Mode), 1 (Silent Mode), ff (default mode) position: 0~100 (0 means open, 100 means closed)")
  parameter: string;
} | {
  commandType: "command";
  command: "turnOff" | "turnOn" | "pause";
};

alias Curtain3Command = CurtainCommand;

model HubRelatedCommand {
  commandType: "command";
  command: "turnOff" | "turnOn" | "setVolume";

  @doc("Volume level: 0~100")
  parameter?: string;
}

model MeterCommand {
  commandType: "command";
  command: "update";
}

model MeterPlusCommand {
  commandType: "command";
  command: "update";
}

model MotionSensorCommand {
  commandType: "command";
  command: "reset";
}

model ContactSensorCommand {
  commandType: "command";
  command: "reset";
}

model LockCommand {
  commandType: "command";
  command: "lock" | "unlock";
}

model PlugCommand {
  commandType: "command";
  command: "turnOff" | "turnOn";
}

model RemoteCommand {
  commandType: "command";
  command: "turnOff" | "turnOn";
}

alias ThermostatCommand = {
  commandType: "command";
  command: "setTemperature";

  @doc("Temperature value to set")
  parameter: string;
} | {
  commandType: "command";
  command: "setMode";

  @doc("Mode: heat, cool, auto, off")
  parameter: string;
};

model CameraCommand {
  commandType: "command";
  command: "startRecording" | "stopRecording" | "capturePhoto";
}

model HumidifierCommand {
  commandType: "command";
  command: "turnOff" | "turnOn" | "setHumidity";

  @doc("Humidity level: 0~100")
  parameter?: string;
}

alias DeviceCommand =
  | BotCommand
  | CurtainCommand
  | Curtain3Command
  | HubRelatedCommand
  | MeterCommand
  | MeterPlusCommand
  | MotionSensorCommand
  | ContactSensorCommand
  | LockCommand
  | PlugCommand
  | RemoteCommand
  | ThermostatCommand
  | CameraCommand
  | HumidifierCommand;

@doc("Device internal error due to device states not synchronized with server")
model DeviceTypeErrorResponseBody
  extends ErrorResponseBody<151, "device type error"> {}

@doc("Device not found")
model DeviceNotFoundErrorResponseBody
  extends ErrorResponseBody<152, "device not found"> {}

@doc("Command is not supported")
model CommandNotSupportedErrorResponseBody
  extends ErrorResponseBody<160, "command is not supported"> {}

@doc("Device offline")
model DeviceOfflineErrorResponseBody
  extends ErrorResponseBody<161, "device offline"> {}

@doc("Hub device is offline")
model HubDeviceOfflineErrorResponseBody
  extends ErrorResponseBody<171, "hub device is offline"> {}

alias DeviceControlErrors =
  | DeviceTypeErrorResponseBody
  | DeviceNotFoundErrorResponseBody
  | CommandNotSupportedErrorResponseBody
  | DeviceOfflineErrorResponseBody
  | HubDeviceOfflineErrorResponseBody;
