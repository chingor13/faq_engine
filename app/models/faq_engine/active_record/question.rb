module FaqEngine
  module ActiveRecord
    class Question < ::ActiveRecord::Base
      self.table_name = :faq_questions
      belongs_to :category, :class_name => "FaqEngine::ActiveRecord::Category"

      validates_presence_of :question, :answer, :category

      def self.model_name
        ActiveModel::Name.new(FaqEngine::Question)
      end
    end
  end
end
