import "@typespec/http";
import "@typespec/openapi";

import "./lib/shared-errors.tsp";
import "./lib/shared-response.tsp";
import "./features/device/list.tsp";
import "./features/device/status.tsp";
import "./features/device/control.tsp";

using TypeSpec.Http;

@service({
  title: "SwitchBot API",
})
@doc("SwitchBot API methods for IoT devices")
@TypeSpec.OpenAPI.info({
  version: "1.1",
})
@TypeSpec.OpenAPI.externalDocs("https://github.com/OpenWonderLabs/SwitchBotAPI/blob/main/README.md")
@server("https://api.switch-bot.com", "Single server endpoint")
@useAuth(
  [
    ApiKeyAuth<ApiKeyLocation.header, "Authorization">,
    ApiKeyAuth<ApiKeyLocation.header, "sign">,
    ApiKeyAuth<ApiKeyLocation.header, "nonce">
  ]
)
namespace SwithcbotAPI;

@route("/devices")
@tag("Devices")
namespace DevicesRoute {
  @summary("Get Device List")
  @summary("The devices API is used to access the properties and states of SwitchBot devices and to send control commands to those devices.")
  @get
  op list(): SharedResponse.GetResponse<{
    @doc("a list of physical devices")
    deviceList: Device.Device[];

    @doc("a list of virtual infrared remote devices")
    infraredRemoteList: Device.Device[];
  }>;

  @summary("Get Device Status")
  @doc("Get the status of a physical device that has been added to the current user's account.")
  @route("/{id}/status")
  @get
  op getStatus(
    @path id: string,
  ): SharedResponse.GetResponse<DeviceStatus.DeviceStatus>;

  @summary("Send Device Control Command")
  @summary("Send control commands to physical devices and virtual infrared remote devices.")
  @route("/{deviceId}/commands")
  @post
  op control(
    @path deviceId: string,
    @body body: DeviceControl.DeviceCommand,
  ): SharedResponse.PostResponse<
    {
      commandId: string;
    },
    DeviceControl.DeviceControlErrors
  >;
}
