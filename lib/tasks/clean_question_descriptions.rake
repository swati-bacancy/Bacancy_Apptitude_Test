namespace :db do
  desc 'Clean question descriptions in the database'
  task clean_question_descriptions: :environment do
    Question.find_each do |question|
      # Remove leading and trailing whitespaces, including \r, \n, and \t characters
      question.update(question_description: question.question_description.strip)
    end
    puts 'Question descriptions cleaned successfully.'
  end
end
