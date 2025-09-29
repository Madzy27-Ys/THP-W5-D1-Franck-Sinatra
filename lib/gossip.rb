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
    puts "Chemin de ton potin: #{filepath}"

    CSV.open(filepath, "ab") do |csv|
      csv << [author, content]
    end
  end
end

Gossip.new("José", "Josiane est nulle").save
