require 'csv'
class Seeds::CSV
  def import
    CSV.foreach(file, headers: true) do |row|
      name = create_name(row['Name'])
      biog = create_biog(row['Biog'])
      facebook = create_facebook(row['Facebook'])
      twitter = create_twitter(row['Twitter'])

      create_artist(row,         name: name,
                                 biog: biog,
                                 facebook: facebook,
                                 twitter: twitter)
    end
  end

  private

  def create_artist(row, options)
    return unless row['New Title']
    artist = Artist.find_or_initialize_by(id: row['Id'])
    artist.name = row['Name'].strip
    artist.biog = row['Biog'].strip
    artist.facebook = options[:facebook] if options[:facebook]
    artist.twitter = options[:twitter] if options[:twitter]
    artist.save!
    puts "created #{row['Name']}"
  end

  def create_from_row(klass, data)
    return unless data
    data.split(',').map do |record|
      record.strip!
      return if record.empty?
      klass.constantize.find_or_create_by(name: record)
    end
  end

  def create_name(name)
    return unless name
    return unless name.strip
    Name.find_or_create_by(name: name.strip)
  end

  def create_biog(biog)
    return unless biog
    return unless biog.strip
    Biog.find_or_create_by(biog: biog.strip)
  end

  def create_facebook(facebook)
    return unless facebook
    return unless facebook.strip
    Facebook.find_or_create_by(facebook: facebook.strip)
  end

  def create_twitter(twitter)
    return unless twitter
    return unless twitter.strip
    Twitter.find_or_create_by(twitter: twitter.strip)
  end

  def file
    Rails.root.join('lib', 'seeds', 'artists.csv')
  end
end
