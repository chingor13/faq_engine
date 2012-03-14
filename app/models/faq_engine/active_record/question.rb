module FaqEngine
  module ActiveRecord
    module Question < ::ActiveRecord::Base
      self.table_name = :faq_questions
      belongs_to :category, :class_name => "FaqEngine::ActiveRecord::Category"

      validates_presence_of :question, :answer, :category

      def self.model_name
        ActiveModel::Name.new(self.class, FaqEngine, "FaqEngine::FaqEngine::Question")
      end
    end
  end
end