namespace WebhookDeleteConfiguration;

alias WebhookDeleteConfigurationRequest = {
  @doc("the type of actions")
  action: "deleteWebhook";

  @doc("the url where all the events are sent to")
  url: string;
};

alias WebhookDeleteConfigurationResponse = {};
