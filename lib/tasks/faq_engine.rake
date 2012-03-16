namespace :faq_engine do
  desc "Seed the FAQ database from config/faq_categories.yml and config/faq_questions.yml"
  task :seed do
    Rails.application.initialize!
    raise "FaqEngine not configured" unless FaqEngine.category_model && FaqEngine.question_model

    category_yml = File.join(Rails.root, "config", "faq_categories.yml")
    raise "No config/faq_categories.yml found." if !File.exists?(category_yml)
    categories = Array(YAML.load_file(category_yml))

    questions_yml = File.join(Rails.root, "config", "faq_questions.yml")
    raise "No config/faq_questions.yml found." if !File.exists?(questions_yml)
    questions = Array(YAML.load_file(questions_yml))

    categories.each do |category_data|
      m = FaqEngine.category_model.new(category_data)
      m.id = category_data["id"] if category_data["id"]
      m.save!
    end

    questions.each do |question_data|
      m = FaqEngine.question_model.new(question_data)
      m.id = question_data["id"] if question_data["id"]
      m.save!
    end
  end
end
