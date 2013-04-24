Andrew Melis
CSPP51050 - OO Design & Architecture
HW1 - Problem 2: Template Method

I've written the Template Method problem in ruby -- it is included as "template_method.rb".

Simply type, "ruby template_method.rb" to run.

I've commented heavily within the file.
The top half defines classes, and the bottom half tests functionality.

My only key change to the directions in the assignment was the moving of the update_balance function
away from the get_account_summary and into the calc_interest function for the Savings Account.

It's necessary to be inside the calc_interest function in order to enable yearly accrual.
