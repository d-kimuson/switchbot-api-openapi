import "../../lib/shared-response.tsp";

namespace DeviceControl;

model SimpleCommand<Command extends string> {
  command: Command;
  parameter: "default";
  commandType: "command";
}

model BotCommand extends SimpleCommand<"turnOff" | "turnOn" | "press"> {}

model CurtainSimpleCommand
  extends SimpleCommand<"turnOff" | "turnOn" | "pause"> {}

model CurtailSetPositionCommand {
  command: "setPosition";

  @doc("index0,mode0,position0\ne.g. 0,ff,80")
  parameter: string;

  commandType: "command";
}

alias CurtainCommand = CurtainSimpleCommand | CurtailSetPositionCommand;

alias Curtain3Command = CurtainCommand;

model LockCommand extends SimpleCommand<"lock" | "unlock"> {}

model LockProCommand extends SimpleCommand<"lock" | "unlock"> {}

model HumidifierSimpleCommand extends SimpleCommand<"turnOn" | "turnOff"> {}
model HumidifierSetModeCommand {
  command: "setMode";

  @doc("auto, set to Auto Mode, 101, set atomization efficiency to 34%, 102, set atomization efficiency to 67%,103, set atomization efficiency to 100%")
  parameter: "auto" | 101 | 102 | 103 | numeric;

  commandType: "command";
}

alias HumidifierCommand = HumidifierSimpleCommand | HumidifierSetModeCommand;

model PlugCommand extends SimpleCommand<"turnOff" | "turnOn"> {}

model PlugMiniUsCommand
  extends SimpleCommand<"turnOff" | "turnOn" | "toggle"> {}

model PlugMiniJpCommand
  extends SimpleCommand<"turnOff" | "turnOn" | "toggle"> {}

model ColorSimpleCommand
  extends SimpleCommand<"turnOff" | "turnOn" | "toggle"> {}

model ColorBulbSetBrightnessCommand {
  command: "setBrightness";

  @doc("set brightness")
  @minValue(1)
  @maxValue(100)
  parameter: numeric;

  commandType: "command";
}

model ColorBulbSetColorCommand {
  command: "setColor";

  @doc("set RGB color value. format: '{0-255}:{0-255}:{0-255}'")
  parameter: string;

  commandType: "command";
}

model ColorBulbSetColorTemperatureCommand {
  command: "setColorTemperature";

  @doc("set color temperature")
  @minValue(2700)
  @maxValue(6500)
  parameter: numeric;

  commandType: "command";
}

alias ColorBulbCommand =
  | ColorSimpleCommand
  | ColorBulbSetBrightnessCommand
  | ColorBulbSetColorCommand
  | ColorBulbSetColorTemperatureCommand;

model StripLightSimpleCommand
  extends SimpleCommand<"turnOff" | "turnOn" | "toggle"> {}

model StripLightSetBrightnessCommand {
  command: "setBrightness";

  @doc("set brightness")
  @minValue(1)
  @maxValue(100)
  parameter: numeric;

  commandType: "command";
}

model StripLightSetColorCommand {
  command: "setColor";

  @doc("set RGB color value. format: '{0-255}:{0-255}:{0-255}'")
  parameter: string;

  commandType: "command";
}

alias StripLightCommand = StripLightSimpleCommand | StripLightSetBrightnessCommand | StripLightSetColorCommand;

model RobotVacuumCleanerS1SimpleCommand
  extends SimpleCommand<"start" | "stop" | "dock"> {}

model RobotVacuumCleanerS1PowLevelCommand {
  command: "PowLevel";

  @doc("set suction power level: 0 (Quiet), 1 (Standard), 2 (Strong), 3 (MAX)")
  parameter: 0 /* Quiet */ | 1 /* Standard */ | 2 /* Strong */ | 3 /* MAX */;

  commandType: "command";
}

alias RobotVacuumCleanerS1Command = RobotVacuumCleanerS1SimpleCommand | RobotVacuumCleanerS1PowLevelCommand;

model RobotVacuumCleanerS1SimplePlusCommand
  extends SimpleCommand<"start" | "stop" | "dock"> {}

model RobotVacuumCleanerS1PlusPowLevelCommand {
  command: "PowLevel";

  @doc("set suction power level: 0 (Quiet), 1 (Standard), 2 (Strong), 3 (MAX)")
  parameter: 0 /* Quiet */ | 1 /* Standard */ | 2 /* Strong */ | 3 /* MAX */;

  commandType: "command";
}

alias RobotVacuumCleanerS1PlusCommand = RobotVacuumCleanerS1SimplePlusCommand | RobotVacuumCleanerS1PlusPowLevelCommand;

model FloorCleaningRobotS10CleaningParameter {
  @doc("fanLevel, the vacuum level, 1-4")
  fanLevel: 1 | 2 | 3 | 4;

  @doc("waterLevel, the mop moisture level, 1-2.")
  waterLevel: 1 | 2;

  @doc("times, the number of cycles, 1-2639999, in theory.")
  @minValue(1)
  @maxValue(2639999)
  times: numeric;
}

model FloorCleaningRobotS10SimpleCommand
  extends SimpleCommand<"addWaterForHumi" | "pause" | "dock"> {}

model FloorCleaningRobotS10StartCleanCommand {
  @doc("start cleaning.")
  command: "startClean";

  parameter: {
    @doc("the cleaning mode, sweep or sweep_mop.")
    action: "sweep" | "sweep_mop";

    param: FloorCleaningRobotS10CleaningParameter;
  };
  commandType: "command";
}

model FloorCleaningRobotS10SetVolumeCommand {
  command: "setVolume";

  @doc("set volume, 1-100")
  @minValue(1)
  @maxValue(100)
  parameter: numeric;

  commandType: "command";
}

model FloorCleaningRobotS10SelfCleanCommand {
  command: "selfClean";

  @doc("mode 1, wash the mop.mode 2, dry itself.mode 3, terminate.")
  parameter: 1 | 2 | 3;

  commandType: "command";
}

model FloorCleaningRobotS10ChangeParamCommand {
  command: "changeParam";
  parameter: FloorCleaningRobotS10CleaningParameter;
  commandType: "command";
}

alias FloorCleaningRobotS10Command =
  | FloorCleaningRobotS10SimpleCommand
  | FloorCleaningRobotS10StartCleanCommand
  | FloorCleaningRobotS10SetVolumeCommand
  | FloorCleaningRobotS10SelfCleanCommand
  | FloorCleaningRobotS10ChangeParamCommand;

model CeilingLightSimpleCommand
  extends SimpleCommand<"turnOn" | "turnOff" | "toggle"> {}

model CeilingLightSetBrightnessCommand {
  command: "setBrightness";

  @doc("set brightness")
  @minValue(1)
  @maxValue(100)
  parameter: numeric;

  commandType: "command";
}

model CeilingLightSetColorTemperatureCommand {
  command: "setColorTemperature";

  @doc("set color temperature")
  @minValue(2700)
  @maxValue(6500)
  parameter: numeric;

  commandType: "command";
}

alias CeilingLightCommand = CeilingLightSimpleCommand | CeilingLightSetBrightnessCommand | CeilingLightSetColorTemperatureCommand;

model CeilingLightProSimpleCommand
  extends SimpleCommand<"turnOn" | "turnOff" | "toggle"> {}

model CeilingLightProSetBrightnessCommand {
  command: "setBrightness";

  @doc("set brightness")
  @minValue(1)
  @maxValue(100)
  parameter: numeric;

  commandType: "command";
}

model CeilingLightProSetColorTemperatureCommand {
  command: "setColorTemperature";

  @doc("set color temperature")
  @minValue(2700)
  @maxValue(6500)
  parameter: numeric;

  commandType: "command";
}

alias CeilingLightProCommand = CeilingLightProSimpleCommand | CeilingLightProSetBrightnessCommand | CeilingLightProSetColorTemperatureCommand;

model KeypandParameter {
  @doc("a unique name for the passcode. duplicates under the same device are not allowed.")
  name: string;

  @doc("type of the passcode. permanent, a permanent passcode. timeLimit, a temporary passcode. disposable, a one-time passcode. urgent, an emergency passcode.")
  type: "permanent" | "timeLimit" | "disposable" | "urgent";

  @doc("a 6 to 12-digit passcode in plain text")
  password: string;

  @doc("set the time the passcode becomes valid from, mandatory for one-time passcode and temporary passcode. a 10-digit timestamp.")
  startTime: numeric;

  @doc("set the time the passcode becomes expired, mandatory for one-time passcode and temporary passcode. a 10-digit timestamp.")
  endTime: numeric;
}

model KeypadCreateKeyCommand {
  command: "createKey";
  parameter: KeypandParameter;
  commandType: "command";
}

model KeypadDeleteKeyCommand {
  command: "deleteKey";
  parameter: {
    @doc("the id of the passcode")
    id: numeric;
  };
  commandType: "command";
}

alias KeypadCommand = KeypadCreateKeyCommand | KeypadDeleteKeyCommand;

model KeypadTouchCreateKeyCommand {
  command: "createKey";
  parameter: KeypandParameter;
  commandType: "command";
}

model KeypadTouchDeleteKeyCommand {
  command: "deleteKey";
  parameter: {
    @doc("the id of the passcode")
    id: numeric;
  };
  commandType: "command";
}

alias KeypadTouchCommand = KeypadTouchCreateKeyCommand | KeypadTouchDeleteKeyCommand;

model BlindTiltSimpleCommand
  extends SimpleCommand<"fullyOpen" | "closeUp" | "closeDown"> {}

model BlindTiltSetPositionCommand {
  command: "setPosition";

  @doc("direction: up/down, position: 0~100 (0 means closed, 100 means open, it MUST be set to a multiple of 2. e.g. up;48 or up; 36)")
  parameter: string;

  commandType: "command";
}

alias BlindTiltCommand = BlindTiltSimpleCommand | BlindTiltSetPositionCommand;

model BatteryCirculatorFanSimpleCommand
  extends SimpleCommand<"turnOn" | "turnOff"> {}

model BatteryCirculatorFanSetNightLightModeCommand {
  command: "setNightLightMode";

  @doc("off, turn off nightlight, 1, bright 2, dim")
  parameter: "off" | 1 | 2;

  commandType: "command";
}

model BatteryCirculatorFanSetWindModeCommand {
  command: "setWindMode";

  @doc("Set fan mode. direct: direct mode. natural: natural mode. sleep: sleep mode. baby: ultra quiet mode")
  parameter: "direct" | "natural" | "sleep" | "baby";

  commandType: "command";
}

model BatteryCirculatorFanSetWindSpeedCommand {
  command: "setWindSpeed";

  @doc("Set fan speed.1~100")
  @minValue(1)
  @maxValue(100)
  parameter: numeric;

  commandType: "command";
}

alias BatteryCirculatorFanCommand =
  | BatteryCirculatorFanSimpleCommand
  | BatteryCirculatorFanSetNightLightModeCommand
  | BatteryCirculatorFanSetWindModeCommand
  | BatteryCirculatorFanSetWindSpeedCommand;

model HomeApplianceSharedCommand extends SimpleCommand<"turnOn" | "turnOff"> {}

model OthersCommand {
  command: string;
  parameter: "default";
  commandType: "customize";
}

model AirConditionerSetAllCommand {
  command: "setAll";

  @doc("{temperature},{mode},{fan speed},{power state}. e.g. 26,1,3,on")
  parameter: string;

  commandType: "command";
}

alias AirConditionerCommand = HomeApplianceSharedCommand | AirConditionerSetAllCommand;

model TvLikeDeviceSimpleCommand
  extends SimpleCommand<
    | "volumeAdd"
    | "volumeSub"
    | "channelAdd"
    | "channelSub"> {}

model TvLikeDeviceSetChannelCommand {
  command: "SetChannel";

  @doc("set the TV channel to switch to")
  parameter: numeric;

  commandType: "command";
}

alias TVLikeDeviceCommand = HomeApplianceSharedCommand | TvLikeDeviceSimpleCommand | TvLikeDeviceSetChannelCommand;

model DvdSimpleCommand
  extends SimpleCommand<
    | "setMute"
    | "FastForward"
    | "Rewind"
    | "Next"
    | "Previous"
    | "Pause"
    | "Play"
    | "Stop"> {}

alias DVDCommand = HomeApplianceSharedCommand | DvdSimpleCommand;

model SpeakerSimpleCommand
  extends SimpleCommand<
    | "setMute"
    | "FastForward"
    | "Rewind"
    | "Next"
    | "Previous"
    | "Pause"
    | "Play"
    | "Stop"
    | "volumeAdd"
    | "volumeSub"> {}

alias SpeakerCommand = HomeApplianceSharedCommand | SpeakerSimpleCommand;

model FanSimpleCommand
  extends SimpleCommand<
    | "swing"
    | "timer"
    | "lowSpeed"
    | "middleSpeed"
    | "highSpeed"> {}

alias FanCommand = HomeApplianceSharedCommand | FanSimpleCommand;

model LightSimpleCommand
  extends SimpleCommand<"brightnessUp" | "brightnessDown"> {}

alias LightCommand = HomeApplianceSharedCommand | LightSimpleCommand;

alias DeviceControlCommand =
  | BotCommand
  | CurtainCommand
  | Curtain3Command
  | LockCommand
  | LockProCommand
  | HumidifierCommand
  | PlugCommand
  | PlugMiniUsCommand
  | PlugMiniJpCommand
  | ColorBulbCommand
  | StripLightCommand
  | RobotVacuumCleanerS1Command
  | RobotVacuumCleanerS1PlusCommand
  | FloorCleaningRobotS10Command
  | CeilingLightCommand
  | CeilingLightProCommand
  | KeypadCommand
  | KeypadTouchCommand
  | BlindTiltCommand
  | BatteryCirculatorFanCommand
  | AirConditionerCommand
  | TVLikeDeviceCommand
  | DVDCommand
  | SpeakerCommand
  | FanCommand
  | LightCommand
  | OthersCommand;

// response
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
