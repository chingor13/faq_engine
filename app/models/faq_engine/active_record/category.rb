require 'active_record/acts/tree'
module FaqEngine
  module ActiveRecord
    class Category < ::ActiveRecord::Base
      self.table_name = :faq_categories
      has_many :questions, 
        :class_name => "FaqEngine::ActiveRecord::Question",
        :inverse_of => :category
      include ::ActiveRecord::Acts::Tree
      acts_as_tree :order => "position"

      validates_presence_of :name, :description

      # hack to get the automatic url generation to work
      def self.model_name
        ActiveModel::Name.new(FaqEngine::Category)
      end
    end
  end
end
