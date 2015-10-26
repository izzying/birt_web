require 'mina/git'

set :domains, ['121.40.117.95']
set :domain, '121.40.117.95'
set :deploy_to, '/usr/local/tomcat/webapps/birt'
set :repository, 'git@github.com:mumaoxi/birt_web.git'
set :branch, 'master'
set :keep_releases, 20
set :rails_env, :production

set :shared_paths, ['build.gradle', 'logs', 'build', 'documents', 'report/images','report/rpts/database.properties']

# mina deploy to=s1
case ENV['to']
  when 's1'
    set :domain, '121.40.117.95' # production 1
  when 'test'
    set :domain, '121.40.117.95' # staging
end

case ENV['for']
  when 'master'
    set :branch, 'master'
  when 'develop'
    set :branch, 'develop'
  else
    if ENV['for']
      set :branch, ENV['for']
    end
end


set :user, 'root'
set :port, '19009'

set :app_path, lambda { "#{deploy_to}/#{current_path}" }

task :environment do
  queue! "source ~/.bash_profile"
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/logs"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/logs"]

  queue! %[mkdir -p "#{deploy_to}/shared/build"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/build"]

  queue! %[mkdir -p "#{deploy_to}/shared/documents"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/documents"]

  queue! %[mkdir -p "#{deploy_to}/shared/report"]
  queue! %[mkdir -p "#{deploy_to}/shared/report/images"]
  queue! %[mkdir -p "#{deploy_to}/shared/report/rpts"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/report/images"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/report/rpts"]

  queue! %[touch "#{deploy_to}/shared/build.gradle"]
  queue %[echo "-----> Be sure to edit 'shared/build.gradle'."]

  queue! %[touch "#{deploy_to}/shared/report/rpts/database.properties"]
  queue %[echo "-----> Be sure to edit 'shared/report/rpts/database.properties'."]

end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:cleanup'
    invoke :'deploy:link_shared_paths'

    to :launch do
      queue! "cd #{app_path} ; gradle clean && gradle build ; cp -r build/classes/main WEB-INF/classes"
    end
  end
end