require 'csv'
class Seeds::CSV
  def import
    CSV.foreach(file, headers: true) do |row|
      instrumentations = create_from_row("Instrumentation", row["Track Instrumentation / Style"])
      moods = create_from_row("Mood", row["Track Mood"])
      composers = create_composers(row["Composer(s)"])
      publisher = create_publisher(row["Publisher"])
      productions = create_productions(row["Programme Origin"])
      
      create_track(row, {
        instrumentations: instrumentations, 
        moods: moods, 
        composers: composers, 
        publisher: publisher, 
        productions: productions
        })
    end
  end

  private

  def create_track(row, options)
    return unless row["New Title"]
    track = Track.find_or_initialize_by(catalogue: row['Catalogue Number'])
    track.title = row['New Title'].strip
    track.oldtitle = row['Original Title '].strip
    track.instrumentations = options[:instrumentations] if options[:instrumentations]
    track.moods = options[:moods] if options[:moods]
    track.composers = options[:composers] if options[:composers]
    track.publisher = options[:publisher] if options[:publisher]
    track.productions = [options[:productions]] if options[:productions]
    track.save!
    puts "created #{row['New Title']}"
  end

  def create_productions(productions)
    return unless productions
    Production.find_or_create_by(name: productions.strip)
  end

  def create_from_row(klass, data)
    return unless data
    data.split(',').map do |record|
      record.strip!
      return if record.empty?
      klass.constantize.find_or_create_by(name: record)
    end
  end

  def create_composers(composers)
    return unless composers
    composers.split(',').map do |composer|
      return unless composer.strip
      Composer.find_or_create_by(name: composer.strip)
    end
  end

  def create_publisher(publisher)
    return unless publisher
    return unless publisher.strip
    Publisher.find_or_create_by(name: publisher.strip)
  end

  def file
    Rails.root.join('lib', 'seeds', 'production.csv')
  end
end