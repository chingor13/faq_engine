require "active_support/dependencies"

module FaqEngine

  mattr_accessor :backend
  mattr_accessor :model

  # Yield self on setup for nice config blocks
  def self.setup
    yield self
  end

end

require "faq_engine/engine"