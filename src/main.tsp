import "@typespec/http";
import "@typespec/openapi";

import "./lib/shared-errors.tsp";
import "./lib/shared-response.tsp";
import "./features/device/list.tsp";
import "./features/device/status.tsp";
import "./features/device/control.tsp";
import "./features/scene/list.tsp";
import "./features/webhook/query.tsp";
import "./features/webhook/configure.tsp";
import "./features/webhook/update.tsp";
import "./features/webhook/delete.tsp";

using TypeSpec.Http;

@service(#{ title: "SwitchBot API" })
@doc("SwitchBot API methods for IoT devices")
@TypeSpec.OpenAPI.info(#{ version: "1.1" })
@TypeSpec.OpenAPI.externalDocs("https://github.com/OpenWonderLabs/SwitchBotAPI/blob/main/README.md")
@server("https://api.switch-bot.com/v1.1", "SwitchBot API v1.1")
@useAuth(
  [
    ApiKeyAuth<ApiKeyLocation.header, "Authorization">,
    ApiKeyAuth<ApiKeyLocation.header, "sign">,
    ApiKeyAuth<ApiKeyLocation.header, "nonce">,
    ApiKeyAuth<ApiKeyLocation.header, "t">
  ]
)
namespace SwitchBotAPI;

@route("/devices")
@tag("Devices")
namespace DevicesRoute {
  @summary("Get Device List")
  @doc("The devices API is used to access the properties and states of SwitchBot devices and to send control commands to those devices.")
  @get
  op list(): SharedResponse.GetResponse<Device.DeviceListResponse>;

  @summary("Get Device Status")
  @doc("Get the status of a physical device that has been added to the current user's account.")
  @route("/{id}/status")
  @get
  op getStatus(
    @path id: string,
  ): SharedResponse.GetResponse<DeviceStatus.DeviceStatusResponse>;

  @summary("Send Device Control Command")
  @doc("Send control commands to physical devices and virtual infrared remote devices.")
  @route("/{deviceId}/commands")
  @post
  op control(
    @path deviceId: string,
    @body body: DeviceControl.DeviceControlCommand,
  ): SharedResponse.PostResponse<
    {
      commandId: string;
    },
    DeviceControl.DeviceControlErrors
  >;
}

@route("/scenes")
@tag("Scenes")
namespace SceneRoute {
  @summary("Get scene list")
  @doc("Get a list of manual scenes created by the current user.")
  @get
  op list(): SharedResponse.GetResponse<Scene.SceneListResponse>;
}

@route("/webhook")
@tag("Webhook")
namespace WebhookRoute {
  @summary("Get webhook configuration")
  @doc("Get the current configuration info of the webhook")
  @route("/queryWebhook")
  @post
  op queryWebhook(
    @body body: WebhookQueryConfiguration.WebhookQueryConfigurationRequest,
  ): SharedResponse.PostResponse<WebhookQueryConfiguration.WebhookQueryConfigurationResponse>;

  @summary("Configure webhook")
  @doc("Configure the url that all the webhook events will be sent to")
  @route("/setupWebhook")
  @post
  op setupWebhook(
    @body body: WebhookSetupConfigure.WebhookSetupConfigureRequest,
  ): SharedResponse.PostResponse<WebhookSetupConfigure.WebhookSetupConfigureResponse>;

  @summary("Update webhook configuration")
  @doc("Update the configuration of the webhook")
  @route("/updateWebhook")
  @post
  op updateWebhook(
    @body body: WebhookUpdateConfiguration.WebhookUpdateConfigurationRequest,
  ): SharedResponse.PostResponse<WebhookUpdateConfiguration.WebhookUpdateConfigurationResponse>;

  @summary("Delete webhook")
  @doc("Delete the configuration of the webhook")
  @route("/deleteWebhook")
  @post
  op deleteWebhook(
    @body body: WebhookDeleteConfiguration.WebhookDeleteConfigurationRequest,
  ): SharedResponse.PostResponse<WebhookDeleteConfiguration.WebhookDeleteConfigurationResponse>;
}
