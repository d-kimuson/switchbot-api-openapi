namespace WebhookSetupConfigure;

model WebhookSetupConfigureRequest {
  @doc("the type of actions")
  action: "setupWebhook";

  @doc("the url where all the events are sent to")
  url: string;

  @doc("the list of device ids, currently only supports 'ALL'")
  deviceList: "ALL";
}

model WebhookSetupConfigureResponse {}
