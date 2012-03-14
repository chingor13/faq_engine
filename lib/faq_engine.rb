require "active_support/dependencies"

module FaqEngine

  class_attribute :model

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end

end

require "faq_engine/engine"