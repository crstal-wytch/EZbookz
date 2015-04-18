class Company < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # exclamation point is added so that if something doesn't work an error will be thrown
      Company.create! row.to_hash
    end
  end
end
