
Kernel.puts("Welcome to Calculator")
Kernel.puts()
Kernel.puts("Enter first number?")
first_num = Kernel.gets().chomp()
Kernel.puts("Enter second number?")
second_num = Kernel.gets().chomp()

Kernel.puts("Which would you like to do? 1) Add 2) Subtract 3) MUltiply 4) Divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = first_num.to_i() + second_num.to_i()
elsif operator == '2'
  result = first_num.to_i() - second_num.to_i()
elsif operator == '3'
  result = first_num.to_i() * second_num.to_i()
elsif operator == '4'
  result = first_num.to_f() / second_num.to_f()
end

Kernel.puts("The result is #{result}")
