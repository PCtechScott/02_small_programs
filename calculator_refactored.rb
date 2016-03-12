# Lesson 2
# calculator.rb

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to enter a valid name!")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  first_num = ''
  second_num = ''
  Kernel.puts()
  loop do
    prompt("Enter first number?")
    first_num = Kernel.gets().chomp()
    if valid_number?(first_num)
      break
    else
      prompt("Invalid number - try again")
    end
  end
  loop do
    prompt("Enter second number?")
    second_num = Kernel.gets().chomp()
    if valid_number?(second_num)
      break
    else
      prompt("Invalid number - try again")
    end
  end

  operator_prompt = <<-MSG
    Which would you like to do?
      1) Add
      2) Subtract
      3) Multiply
      4) Divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             result = first_num.to_i() + second_num.to_i()
           when '2'
             result = first_num.to_i() - second_num.to_i()
           when '3'
             result = first_num.to_i() * second_num.to_i()
           when '4'
             result = first_num.to_f() / second_num.to_f()
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation (Y to calculate again)?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the caculator, #{name}! Goodbye!")
