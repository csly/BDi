class ArticleWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform(*args)
    articles = Article.to_publish
    articles.update_all(status: 1, scheduled_at: nil)
  end
end