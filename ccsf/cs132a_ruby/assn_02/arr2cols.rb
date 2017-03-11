#!/usr/local/bin/ruby
# Name: Kelly Hong
# Date: Wednesday, September 14, 2016
# File: arr2cols.rb
# Desc: write a Ruby script named arr2cols.rb that prints an array’s contents as formatted rows and columns.
#       Example tables: escargot_player_data, employees, and artists
#       script must work with all three arrays.
#
# ASSN URL: https://ccsf.instructure.com/courses/2612/assignments/21798
# ex output: http://hills.ccsf.edu/~kfreedma/cs132a/lab2.cgi

puts "-" * 8
puts "SETUP - CREATE ARRAYS"
puts "-" * 8

# Table 1: Escargot Players Data
# A array containing Escargot player data
escargot_player_data = [
    # Column names: name character points
    ['Jim','bullfrog',99],
    ['Mack the Knife','caterpillar',12],
    ['Willy','chihuahua',143],
    ['Trudy','bunny',3],
    ['Mary Lou','slow loris',1443],
    ['Sharon Stone','komodo dragon',8888],
]

# Table 2: Employee data
employees = [
    # coded with syntactical sugar to create an array of strings
    #  Name Address City State SSN Telephone
    %w(Walter\ White, 123\ Happy\ Home\ Drive Albuquerque NM 555-66-7777 505-123-4567 ),
    %w(Jesse\ Pinkman, 43\ Cloudy\ Skies\ Parkway Albuquerque NM  666-12-3456, 505-888-9999 ),
    %w(Gustavo\ Fring, 123\ Pollos\ Boulevard Albuquerque NM 565-32-3344, 505-434-9001 ),
    %w(Tuco\ Salamanca, 99\ Crystal\ Springs\ Lane Albuquerque NM 575-44-3553, 505-776-0455 ),
    %w(Saul\ Goodman, 9800\ Montgomery\ Blvd\ NE Albuquerque NM 585-19-9990, 505-503-4455 )
]

# Table 3: Artist Addresses and Income
artists = [
    # column names
    %w( first_name last_name telephone address city state zip_code birthdate salary ),

    [ 'Vinh',
      'Tranh',
      '438-910-7449',
      '8235 Maple Street',
      'Wilmington',
      'VM',
      '29085',
      '9/23/63',
      '1200'
    ],

    [ 'William',
      'Kopf',
      '846-836-2837',
      '6937 Ware Road',
      'Milton',
      'PA',
      '93756',
      '9/21/46',
      '43500'
    ],

    [ 'Yukio',
      'Takeshida',
      '387-827-1095',
      '13 Uno Lane',
      'Ashville',
      'NC',
      '23556',
      '7/1/29',
      '57000'
    ],

    [ 'Zippy',
      'Pinhead',
      '834-823-8319',
      '2356 Bizarro Ave.',
      'Farmount',
      'IL',
      '84357',
      '1/1/67',
      '89500'
    ],
    [ 'Andy',
      'Warhol',
      '212-321-7654',
      '231 East 47th Street',
      'New York City',
      'NY',
      '10017',
      '8/6/1928',
      '2700000'
    ]
]

# create dimensional array
all_arrays = [
  [escargot_player_data, "Table 1: Escargot Players Data"], 
  [employees, "Table 2: Employees"], 
  [artists, "Table 3: Artist Addresses and Income"]
]

all_arrays.each do |array|
  puts array.last()

  maxVal = []
  array.first().each do |row|
    row.each_with_index do |col, i|
      maxVal[i] = [maxVal.at(i) || 0, col.to_s.length].max
    end
  end

  # Iterate thru element in all_arrays which contains Data.
  # Print each row in colMax-space columns using String#%.
  array.first().each do |arr|
  # left justified with %-<value>s for readability
    arr.zip(maxVal) do |item, colMax| 
      printf("%-#{colMax + 2}s" , item)
    end
    puts
  end

  puts
end