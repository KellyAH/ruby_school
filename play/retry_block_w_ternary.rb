def retry_loop
  retry_count ||= 3
  SnapLogin.new.snap_sign_in
rescue StandardError => e
  puts "Inside rescue"
  (retry_count -= 1).zero? ? "Log Error" : retry
end

p retry_loop
