class Company < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # exclamation point is added so that if something doesn't work an error will be thrown
      Company.create! row.to_hash
    end
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |company|
        csv << company.attributes.values_at(*column_names)
      end
    end
  end
end
