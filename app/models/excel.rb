class Excel
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    data = {x: header, columns: [], keys: []}
    (2..spreadsheet.last_row).each do |i|
      data[:columns] << spreadsheet.row(i)
      data[:keys] << spreadsheet.row(i)[0]
    end
    return data
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end