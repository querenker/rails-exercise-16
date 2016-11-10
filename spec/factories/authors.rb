FactoryGirl.define do
  factory :author do
	first_name "Alan"
	last_name "Turing"
	homepage "http://wikipedia.de/Alan_Turing"
  end

  factory :new_author, class: :author do
    first_name "Peter"
    last_name "Plagiarist"
	homepage "http://example.com"
  end

end
