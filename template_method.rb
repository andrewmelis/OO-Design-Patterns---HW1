#Andrew Melis
#CSPP5150
#hw1 - Template Method

##########
#class declaration section
##########

# "abstract" class to be implemented by other classes
class Account

  attr_accessor :interest_rate, :balance, :year_opened, :last_balance_check
  
  def initialize(balance, year_opened)
    self.balance = balance
    self.year_opened = year_opened
    self.last_balance_check = self.year_opened
  end

  def get_account_summary
    interest = calc_interest
    update_balance(interest)
    print_summary(interest)
  end

  def calc_interest
    raise 'Called calc_interest from abstract Account class'
  end

  def update_balance(interest)
    self.balance = balance+interest
  end

  def print_summary(interest)
    puts "Account currently has balance of $#{self.balance}"
    puts "Earning interest at #{self.interest_rate*100}% per year"
    puts "Earned $#{interest} since last balance check in #{self.last_balance_check}"
    puts "Account open since #{self.year_opened}"
    self.last_balance_check = Time.now.year
  end

end

class CheckingAccount < Account

  def initialize(balance, year_opened)
    super
    self.interest_rate = 0 
  end

  def calc_interest
    return self.balance * self.interest_rate
  end

  def print_summary(interest)
    super
    puts "Account Type: Checking"
  end

end

class SavingsAccount < Account
  
  def initialize(balance, year_opened)
    super(balance, year_opened)
    self.interest_rate = 1	  #that's right, 100% interest rate. This savings account must be Apple stock or something
  end

  def calc_interest
    interest = 0
    (Time.now.year-self.last_balance_check).times do
      interest += self.balance * self.interest_rate
    end
    return interest
  end

  def print_summary(interest)
    super
    puts "Account Type: Savings"
  end

end

##########
#testing section
##########
puts "\n\nNOW TESTING\n\n"

c = CheckingAccount.new(100,2008)
c.get_account_summary


puts "\n"

s = SavingsAccount.new(100,2008)
s.get_account_summary
s.get_account_summary
