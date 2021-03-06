module MiqToolsServices
  class Github
    include ServiceMixin

    class << self
      attr_accessor :credentials
    end
    delegate :credentials, :to => self

    def self.configure
      return if @configured

      ::Github.configure do |config|
        config.login           = credentials["username"]
        config.password        = credentials["password"]
        config.auto_pagination = true
      end

      @configured = true
    end

    def initialize(options)
      @options = options
      service # initialize the service
    end

    def service
      @service ||= begin
        require 'github_api'
        self.class.configure
        ::Github.new(@options)
      end
    end

    def select_issue_comments(issue_id)
      raise "no block given" unless block_given?
      issues.comments.all(:issue_id => issue_id).select { |c| yield c }
    end

    def create_issue_comments(issue_id, comments)
      Array(comments).each do |comment|
        issues.comments.create(
          :issue_id => issue_id,
          :body     => comment
        )
      end
    end

    def edit_issue_comment(comment_id, comment)
      issues.comments.edit(
        :comment_id => comment_id,
        :body       => comment
      )
    end

    def delete_issue_comments(comment_ids)
      Array(comment_ids).each do |comment_id|
        issues.comments.delete(:comment_id => comment_id)
      end
    end
  end
end
