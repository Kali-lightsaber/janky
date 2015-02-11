module Janky
  module Notifier
    class ChatService
      def self.completed(build)
        emoji_status = build.green? ? ":white_check_mark:" : ":no_entry:"
        color = build.green? ? "green" : "red"

        message = "%s %s/%s [#%s - %s] (%ss) %s" % [
          emoji_status,
          build.repo_name,
          build.branch_name,
          build.number,
          build.sha1,
          build.duration,
          build.compare
        ]

        ::Janky::ChatService.speak(message, build.room_id, {:color => color})
      end
    end
  end
end
