class HtmlTable

  def initialize
    # Data cell tags
    @data_separator = "\t\t<td>%s</td>\n"
    @header_separator = "\t\t<th>%s</th>\n"

    # Table tags
    @table_close = "</table>"
  end

  def make_table(header_data, row_data)
    # Print table open tag & header row
    puts "<table>\n"
    make_header(header_data)
    make_row(row_data)
  end

  def make_header(header_data)
    # Print header array as one with separator
    puts "\t<tr>\n" + header_data.map {|x| @header_separator % x }.join('') + "</tr>"
  end

  def make_row(row_data)
  # Print each array as columns with separator
    row_data.each do |a_row|
      # Print the data in the array as a row, inserting the tags
      puts "\t<tr>\n" + a_row.map {|x| @data_separator % x }.join('') + "\t</tr>\n"

      # Print the closing table tag if a_row is the last row
      puts @table_close + "\n" if a_row == row_data.last
    end
  end

end
