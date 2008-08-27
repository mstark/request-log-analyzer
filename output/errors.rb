# Print errors that occured often
amount = $arguments[:amount] || 10
puts
puts "Errors"
puts green("========================================================================")
$summarizer.sort_errors_by(:count).reverse[0, amount.to_i].each do |a|
  puts "#{(a[0] + 'Error').ljust(50)}: [#{green("%d requests")}]" % a[1][:count]
  puts blue(' -> ' + (a[1][:exception_strings].invert[ a[1][:exception_strings].values.max ])[0..79])
end