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

def formula(p, j, n) # calculates monthly payment
  (p.to_f * (j.to_f / (1 - (1 + j.to_f)**-n.to_f))).round(2)
  # "%.2f" % m # rounds to 2 decimal places
end

prompt('Welcome to your Monthly Loan Calculator.')
loop do
  prompt('Please enter the amount you wish to borrow:')
  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    if loan_amount.empty?() || (loan_amount.to_f() <= 0)
      prompt('Loan amount must be greater than $0.')
      prompt('Please enter another amount:')
    else
      break
    end
  end

  prompt('Please enter the Annual Percentage Rate (APR)')
  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    if apr.empty?() || (apr.to_f() <= 0)
      prompt('APR must be greater than 0%.')
      prompt('Please enter another amount:')
    else
      break
    end
  end

  month_interest_rate = apr.to_f / 1200 # get monthly interest rate

  prompt('Please enter the number of years you would intend to take loan for:')
  years = ''
  loop do
    years = Kernel.gets().chomp()
    if years.empty?() || (years.to_i(0) <= 0)
      prompt('Number of Years must be greater than 0. Please enter again:')
    else
      break
    end
  end

  loan_duration = years.to_i() * 12

  monthly_payment = formula(loan_amount, month_interest_rate, loan_duration)

  prompt("Your monthly payment will be:")
  prompt("$#{monthly_payment} per month for #{years} years")

  prompt('Do you want to calculate another?. Type Y to continue or N to end.')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Loan Calculator. Good bye!")
