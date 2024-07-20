namespace WebhookUpdateConfiguration;

alias WebhookUpdateConfigurationRequest = {
  @doc("the type of actions")
  action: "updateWebhook";

  @doc("the configuration details you want to update. you can change the current url or enable/disable the webhook. refer to the example below")
  config: {
    url: string;
    enable: boolean;
  };
};

alias WebhookUpdateConfigurationResponse = {};
