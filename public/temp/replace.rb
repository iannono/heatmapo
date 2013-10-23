
origin = File.readlines("20131022.txt", "\n")
index = 1
File.open("result.txt", "wb") do |f|
  origin.each do |line|
    f.write("#{index}," + line.split(' ').join(',') + ", 2013-10-23" + "\n")
    index += 1
  end
end 
puts "ok"
