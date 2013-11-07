files = Dir.entries(".")

index = 1

File.open("result.csv", "w") do |r|

  files.each do |file|
    next if file.slice(-3..-1) != "csv"

    site_id = file.to_i 
    File.readlines(file, "\n").each_with_index do |line, i|
      next if i == 0 || line.strip == ""
      r.write("#{index},#{line.strip},2013-11-7,#{site_id}\n")
      index += 1
    end

    puts "finished #{file}"
  end 

end

puts "ok"
