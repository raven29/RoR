require File.dirname(__FILE__) + '/../test_helper'
  
class EmailTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  fixtures :emails

  def test_truth
    email_1 = emails(:wrong)
	email_2 = emails(:right)
	
	assert !email_1.valid?
	assert !email_1.save
	assert email_1.errors.invalid?(:address)
	assert !email_1.errors.invalid?(:subject)
	assert !email_1.errors.invalid?(:body)
	assert !email_1.errors.invalid?(:important)
	assert !email_1.errors.invalid?(:deleted)
	assert !email_1.errors.invalid?(:sent)
	
	assert email_2.valid?
	assert email_2.valid?
	assert !email_2.errors.invalid?(:address)
	assert !email_2.errors.invalid?(:subject)
	assert !email_2.errors.invalid?(:body)
	assert !email_2.errors.invalid?(:important)
	assert !email_2.errors.invalid?(:deleted)
	assert !email_2.errors.invalid?(:sent)
	
  end
end
