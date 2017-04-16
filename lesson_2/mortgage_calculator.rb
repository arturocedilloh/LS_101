# INPUT:
# ask for loan amount
# ask for APR
# ask for loan duration

# OUTPUT:
# Monthly payment.
# formula ->  m = p*(j/(1-(1+j)**(-n)))
#        where m = monthly payment
#              p = loan amount
#              j = monthly interest rate
#              n = loan duration in months

# require 'pry' # <= add this to use pry

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_input?(valid_number)
  valid_number.empty?() || (valid_number.to_f() <= 0)
end

def calc_month_formula(loan_amount, month_int_rate, loan_duration)
  (loan_amount.to_f *
  (month_int_rate.to_f /
  (1 - (1 + month_int_rate.to_f)**-loan_duration.to_f))).round(2)
end

prompt('Welcome to your Monthly Loan Calculator.')
loop do
  prompt('Please enter the amount you wish to borrow:')
  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    break unless valid_input?(loan_amount)
    prompt('Loan amount must be greater than $0.')
    prompt('Please enter another amount:')
  end

  prompt('Please enter the Annual Percentage Rate (APR)')
  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    break unless valid_input?(apr)
    prompt('APR must be greater than 0%.')
    prompt('Please enter another amount:')
  end

  month_int_rate = apr.to_f / 1200 # get monthly interest rate

  prompt('Please enter the number of years you would intend to take loan for:')
  years = ''
  loop do
    years = Kernel.gets().chomp()
    break unless valid_input?(years)
    prompt('Number of Years must be greater than 0. Please enter again:')
  end

  loan_duration = years.to_i() * 12

  month_payment = calc_month_formula(loan_amount, month_int_rate, loan_duration)

  prompt("Your monthly payment will be:")
  prompt("$#{month_payment} per month for #{years} years")

  answer = ''
  loop do # check if Y or N is entered
    prompt('Do you want to calculate another?. Type Y to continue or N to end.')
    answer = Kernel.gets().chomp()
    break if %w(y n).include? answer.downcase()
    prompt('Incorrect value. Please enter Y to continue or N to end.')
  end
  break unless answer.downcase() == 'y' # exit if N is answered
end

prompt("Thank you for using Loan Calculator. Good bye!")
