namespace WebhookQueryConfiguration;

alias WebhookQueryConfigurationRequest = {
  @doc("the type of actions, currently supports 'queryUrl', 'queryDetails'")
  action: "queryUrl";
} | {
  @doc("the type of actions, currently supports 'queryUrl', 'queryDetails'")
  action: "queryDetails";

  @doc("the url where all the events are sent to. you need to specify the url when using queryDetails")
  urls: Array<string>;
};

alias WebhookQueryConfigurationResponse = {
  // queryUrl
  urls: Array<string>;
} | Array<{
  url: string;
  createTime: numeric;
  lastUpdateTime: numeric;
  deviceList: "ALL";
  enable: true;
}>;
