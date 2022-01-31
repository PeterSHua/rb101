=begin
input: loan amount, annual percentage rate (APR), duration in years
output: monthly interest rate, duration in months, monthly payment

Get the required inputs from the user
Calculate the variables in
m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

Print the outputs to the user

Example:
Amount: $100,000
Term: 10 years
Rate: 6%
Monthly: $1,110.21

Prompt user for loan amount.
Get the input.
Print a message if input is invalid.
Loop until a valid number is received.

Prompt user for APR.
Get the input.
Print a message if input is invalid.
Loop until a valid number is received.

Prompt user for duration.
Get the input.
Print a message if input is invalid.
Loop until a valid number is received.

Calculate and print the monthly payment
=end
require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(msg)
  puts "=> #{msg}"
end

def integer?(num)
  Integer(num) rescue false
end

def float?(num)
  Float(num) rescue false
end

def number?(num)
  integer?(num) || float?(num) && num > 0
end

def get_number
  loop do
    num = gets.chomp
    return num.to_f if number?(num)
    prompt(MESSAGES['invalid_input'])
  end
end

loop do
  prompt(MESSAGES['welcome'])

  loan_amount = get_number(prompt(MESSAGES['prompt_amount']))
  apr_monthly = get_number(prompt(MESSAGES['apr_amount'])) / 12 / 100
  duration_months = get_number(prompt(MESSAGES['duration_amount'])) * 12

  monthly_amount = loan_amount * ((apr_monthly) / (1 -
    (1 + apr_monthly)**(-duration_months)))

  prompt(MESSAGES['result'])
  puts format('%.2f', monthly_amount)

  prompt(MESSAGES['exit'])
  break unless gets.chomp.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
