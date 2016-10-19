class HtmlTable

  def initialize
    html_table = ""
  end

  def make_table(header_data, row_data)
    html_table <<
    puts "Content-type: text/html"
    puts "<table>"
    make_header(header_data)
    make_row(student_data)
    puts "</table>"
  end

  def make_header(header_data)
    header_data.each do |header|
      make_html_header(header)
    end
  end

  def make_row(row_data)
    make_html_data_row(row_data)
  end


  private

  def make_html_header(header_value)
    puts "<th>#{header_value}</th>"
  end

  def make_html_data_row(data)

    data.each do |value|
      puts "<tr>"
      make_html_data_cell
      puts "</tr>"
    end

  end


  def make_html_data_cell(data)
    puts "<tr>"
    data.each do |value|
      puts "<td>#{value}</td>"
    end
    puts "</tr>"
  end

end
