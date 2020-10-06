# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.1'
Rails.application.config.assets.precompile += %w( ckeditor/* articles.js )
Rails.application.config.assets.precompile += %w( staffs.js )
Rails.application.config.assets.precompile += %w( artists.js )
Rails.application.config.assets.precompile += %w( releases.js )
Rails.application.config.assets.precompile += %w( awards.js )
Rails.application.config.assets.precompile += %w( videos.js )
Rails.application.config.assets.precompile += %w( vimeos.js )
Rails.application.config.assets.precompile += %w( presses.js )
Rails.application.config.assets.precompile += %w( materialize.js )
Rails.application.config.assets.precompile += %w( artawrpre.js )
Rails.application.config.assets.precompile += %w( jquery.js ) 
Rails.application.config.assets.precompile += %w( jquery-1.12.1.js ) 
Rails.application.config.assets.precompile += %w( products.js ) 
Rails.application.config.assets.precompile += %w( items.js )
Rails.application.config.assets.precompile += %w( k1.jpg )
Rails.application.config.assets.precompile += %w( kizzy.png )
Rails.application.config.assets.precompile += %w( tmlogo.png )
Rails.application.config.assets.precompile += %w( amazon.png )
Rails.application.config.assets.precompile += %w( itunes.png )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
