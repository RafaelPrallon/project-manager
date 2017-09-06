notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL_PROJECT_MANAGER'] do
  defaults channel: "#rafael-prallon",
           username: "project-manager"
end