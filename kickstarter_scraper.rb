# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  #projects: kickstarter.css("li.project.grid_4")

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {}
  end

  projects
end

create_project_hash
