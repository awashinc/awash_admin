# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( main.css main.js )
Rails.application.config.assets.precompile += %w( admin/css.css admin/netstats.css admin/analytics.js admin/netstats.js sessions.css )
=begin
Rails.application.config.assets.precompile += %w( iCheck/skins/flat/green.css bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css  jqvmap/jqvmap.min.css bootstrap-daterangepicker/daterangepicker.css gentelella/custom.min.css )
Rails.application.config.assets.precompile += %w( gauge.js/gauge.min.js Chart.js/Chart.min.js fastclick/fastclick.js bootstrap-daterangepicker/daterangepicker.js)
Rails.application.config.assets.precompile += %w( iCheck/icheck.min.js  bootstrap-progressbar/bootstrap-progressbar.min.js DateJS/date.ko.js jqvmap/jqvmap.min.js jqvmap/maps/jquery.vmap.world.js jqvmap/jquery.vmap.js  jqvmap/jquery.vmap.sampledata.js  gentelella/custom.min.js )
Rails.application.config.assets.precompile += %w( flot.orderbars/jquery.flot.orderBars flot-spline/jquery.flot.spline.min flot.curvedlines/curvedLines skycons/skycons.js )
Rails.application.config.assets.precompile += %w( Flot/jquery.flot.js Flot/jquery.flot.pie.js Flot/jquery.flot.time.js Flot/jquery.flot.stack.js Flot/jquery.flot.resize.js ) 
=end
Rails.application.config.assets.precompile += %w( footermanifest.js)
Rails.application.config.assets.precompile += %w( jqvmap/jquery.vmap.sampledata.js )
