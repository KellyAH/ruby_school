def retry_loop
  retry_count ||= 3
  puts "retry_count is: #{retry_count}"


    #SnapLogin.new.snap_sign_in
    #puts "fake success!"
    #fake fail 2x, success 3rd time.
  if retry_count > 1
    SnapLogin.new.snap_sign_in
  else
    puts "fake a successful call!"
  end
rescue StandardError => e
  puts "Inside rescue"
  retry unless (retry_count -= 1).zero?
  puts "retry failed 3 times"
ensure
  puts "this ensure line is always executed."
end

retry_loop


puts
