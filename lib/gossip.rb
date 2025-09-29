require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author = "Mon super auteur", content = "Ma super description")
    @author = author
    @content = content
  end

  def save
  dir = File.join(__dir__, "db")
  Dir.mkdir(dir) unless Dir.exist?(dir)
  filepath = File.join(__dir__, "db", "gossip.csv")
  
  puts "="*20
  puts "Sauvegarde en cours.."
  puts "Chemin : #{File.expand_path(filepath)}"
  puts "Auteur : #{@author}"
  puts "Contenu : #{@content}"
  puts "="*20
  
  CSV.open(filepath, "ab") do |csv|
    csv << [@author, @content]
end
end

 def self.all
    all_gossips = []
    filepath = File.join(__dir__, "db", "gossip.csv")

    # On lit chaque ligne du CSV
    CSV.read(filepath).each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end

    return all_gossips
  end

  def self.find(id)
    all_gossips = self.all
    all_gossips[id.to_i]
  end
end

# Gossip.new("José", "Josiane est nulle").save
