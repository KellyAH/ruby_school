def retry_loop(error_msg)
  retry_count ||= 3
  SnapLogin.new.snap_sign_in
rescue StandardError => e
  puts "Inside rescue"
  (retry_count -= 1).zero? ? "#{error_msg.to_s}" : retry
end

retry_loop("it broke!")
