class User < ApplicationRecord
    def self.import(file)
        CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
            User.create! row.to_hash
        end
    end

    def self.to_csv(fields = column_names, options={})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |user|
          csv << user.attributes.values_at(*column_names)
        end
      end
    end
end
