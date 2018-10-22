# oAuth

###Steps to Run In Development Environment
1. Clone the repository
2. Run `bundle install` command in projects root directory
3. Add `database`, `username` and `password` for your postgres DB in development environment.
3. Run `rake db:migrate` command in projects root directory
4. Create `.env` file at root of the projectvand add following environment variables with there respctive values.
	- GITHUB_CLIENT_ID = `oAuth Application client ID`
	- GITHUB_SECRET_TOKEN= `oAuth Application Client Secret`
		- To get `oAuth Application client ID` and  `oAuth Application Client Secret` login to your github account then follow below steps
			1. Goto settings
			2. Developer settings
			3. oAuth apps
			4. Register new application
			5. Please set Authorization callback URl to http://domain_name/auth/github/callback
4. Run `rails s` command at root of project