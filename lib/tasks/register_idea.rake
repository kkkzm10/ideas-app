namespace :register_idea do
  desc 'リクエストされてきたideaのbodyをrescueしながらideasテーブルに登録する'
  task rescue: :environment do
    Idea.create(body: 'soccer')
  rescue StandardError => e
    Rails.logger.debug e.message
  end
end
