class Product < ActiveRecord::Base
  #def self.import(file)
    #spreadsheet = open_spreadsheet(file)
    #header = spreadsheet.row(1)
    #(2..spreadsheet.last_row).each do |i|
    #  row = Hash[[header, spreadsheet.row(i)].transpose]
    #  product = find_by_id(row["id"]) || new
    #  product.attributes = row.to_hash.slice(*accessible_attributes)
    #  product.save!
    #end
    
  #  spreadsheet = open_spreadsheet(file)
  #  header = spreadsheet.row(1)
  #  data = {x: header, columns: []}
  #  #logger.debug header
  #  (2..spreadsheet.last_row).each do |i|
  #    #logger.debug spreadsheet.row(i)
  #    #row = Hash[[header, spreadsheet.row(i)].transpose]
  #    #logger.debug spreadsheet.row(i)
  #    data[:columns] << spreadsheet.row(i)
  #    #product = find_by_id(row["id"]) || new
  #    #product.attributes = row.to_hash
  #    #product.save!
  #  end
  #  
  #  logger.debug data
  #end
  
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
