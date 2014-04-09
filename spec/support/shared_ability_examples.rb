shared_examples_for "has ability" do |action|
  it "should have #{action} ability" do
    ability.should be_able_to action, @object
  end
end

shared_examples_for "does NOT have ability" do |action|
  it "should NOT have #{action} ability" do
    ability.should_not be_able_to action, @object
  end
end

shared_examples_for "has restful abilities" do |actions|
  actions = [actions].flatten
  actions.each do |action|
    include_examples "has ability", action
  end
  RESTFUL_ACTIONS.reject{|action| actions.include? action}.each do |action|
    include_examples "does NOT have ability", action
  end
end

shared_examples_for "has no abilities" do
  include_examples "has restful abilities", []
end

