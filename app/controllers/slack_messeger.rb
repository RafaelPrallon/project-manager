class SlackMesseger
  def generate_notifier
    notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL_PROJECT_MANAGER'] do
      defaults channel: "#rafael-prallon",
              username: "project-manager"
    end
  end

  def send_message(notifier, message)
    Slack::Notifier::Util::LinkFormatter.format(message)
    notifier.ping message
  end
end