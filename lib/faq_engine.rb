require "active_support/dependencies"

module FaqEngine

  mattr_accessor :category_model, :question_model

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end

  def self.backend=(type = :activerecord)
    case type
    when :activerecord
      self.category_model = FaqEngine::ActiveRecord::Category
      self.question_model = FaqEngine::ActiveRecord::Question
    when :mongo
    when :redis
    end
  end

end

require "faq_engine/engine"
