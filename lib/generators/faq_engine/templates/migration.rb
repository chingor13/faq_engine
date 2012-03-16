class CreateFaqTables < ActiveRecord::Migration
  def self.up
    create_table :faq_categories do |t|
      t.integer :parent_id
      t.string  :name
      t.string  :description
      t.integer :position
    end
    add_index :faq_categories, :parent_id
    add_index :faq_categories, :position

    create_table :faq_questions do |t|
      t.integer :category_id
      t.string  :question
      t.text    :answer
      t.integer :position
    end
    add_index :faq_questions, :category_id
    add_index :faq_questions, :position
  end

  def self.down
    drop_table :faq_questions
    drop_table :faq_categories
  end
end
