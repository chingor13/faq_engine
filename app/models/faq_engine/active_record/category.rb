module FaqEngine
  module ActiveRecord
    class Category < ::ActiveRecord::Base
      self.table_name = :faq_categories
      has_many :questions, 
        :class_name => "FaqEngine::ActiveRecord::Question",
        :inverse_of => :category

      validates_presence_of :name, :description

      # hack to get the automatic url generation to work
      def self.model_name
        ActiveModel::Name.new(self.class, FaqEngine, "FaqEngine::FaqEngine::Category")
      end
    end
  end
end