class KeithHtmlTable


  def initialize
    # Data cell tags
    @data_separator = "\t\t<td>%s</td>\n"

    # Table header <th></th> tags
    header_separator_start = "<th>\n"
    header_separator_end = "\t</th>\n"

    # Table row <tr></tr> tags
    row_separator_start = "<tr>\n"
    row_separator_end = "\t</tr>\n"

    # Table tags
    @table_start = "<table>"
    @table_close = "</table>"
  end


  def make_header(header_data)
    header_separator = "\t\t<th>%s</th>\n"

    # Print header array as one with separator
    puts "\t<tr>\n" + header_data.map {|x| header_separator % x }.join('') + "</tr>"
  end

  def make_table(header_data, row_data)
  # Print each array as columns with separator
    row_data.each do |a_row|
      # If this if the first row, print the open table tag
      puts @table_start + "\n" if a_row == row_data.first

      make_header(header_data)

      # Print the data in the array as a row, inserting the tags
      puts "\t<tr>\n" + a_row.map {|x| @data_separator % x }.join('') + "</tr>"

      # Print the closing table tag if a_row is the last row
      puts @table_close + "\n" if a_row == row_data.last
    end
  end

end
