Jekyll::Hooks.register :site, :pre_render do |site|
  # code to call after Jekyll renders a post
  site.config['asset_version'] = Time.now().to_i.to_s
end

Jekyll::Hooks.register :site, :post_write do |site|
  # code to call after Jekyll renders a post
  puts 'generating resources for ' + site.config['asset_version']
  Dir.mkdir(site.config['destination'] + '/v', 0700) #=> 0
  system('./node_modules/.bin/cleancss -o ' + site.config['destination'] + '/v/main-' + site.config['asset_version'] +'.css ' +   site.config['source']  + '/style/main.css')
  if (ENV['JEKYLL_ENV'] == 'production') then 
    system('./node_modules/.bin/webpack -p ' + site.config['source']  + '/scripts/site.js '  + site.config['destination'] + '/v/main-' + site.config['asset_version'] + '.js');
  else 
    system('./node_modules/.bin/webpack -d ' + site.config['source']  + '/scripts/site.js '  + site.config['destination'] + '/v/dev-' + site.config['asset_version'] + '.js');
  end
end
