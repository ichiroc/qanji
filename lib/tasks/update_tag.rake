# frozen_string_literal: true
task :update_tags do
  `ctags --exclude="#{Rails.root}/app/assets/javascripts/webpack/app.js" -e -R #{Rails.root}/client/src #{Rails.root}/app`
  puts 'TAGS is updated.'
end
