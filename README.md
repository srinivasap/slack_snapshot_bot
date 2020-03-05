# slack_snapshot_bot
Slack bot to obtain snapshot of webpage

## Components Setups

### Registering Slack App
1. Create slack app - https://api.slack.com/apps
2. Features > Slash Commands > configure slash commands that bot has to handle, if any
3. OAuth & Permissions > Redirect URLs > configure {ngrok url or hosted dns}/auth/slack/callback
4. OAuth & Permissions > Scopes > add scopes that app can access
5. Event Subscriptions > Enable Events
6. Event Subscriptions > Enable Events > Request URL > {ngrok url or hosted dns}/slack/events
7. Event Subscriptions > Subscribe to bot events > events that bot should receive

### Bot App that handles published events
1. Nodejs app with slack web and events api
2. Puppeteer integration to lauch headless browser and take snapshot of webpage
3. ngrok to setup http tunnel between slack events publishing and bot app

## References:
1. https://slack.dev/node-slack-sdk/events-api
2. https://github.com/slackapi/node-slack-events-api/tree/master/examples/greet-and-react
3. https://developers.google.com/web/updates/2017/04/headless-chrome#cli
4. https://github.com/puppeteer/puppeteer
5. https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md
6. https://github.com/karma-runner/karma-chrome-launcher/issues/158#issuecomment-396914961
7. https://github.com/slackapi/build-this-bot-workshop