# Run with rspec
require 'faraday'
require 'rspec'

URL = 'http://staging.opennorth.ca'

# Nginx configuration is evil.
describe Faraday do
  it 'should get 200 response code' do
    %w(/ /about/).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 200
    end
  end
  it 'should get 301 response code' do # avoid duplicate content
    %w(/index.html /index /index/).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 301
      Faraday.head("#{URL}#{path}").env[:response_headers][:location].should == "#{URL}/"
    end
    %w(/about.html /about).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 301
      Faraday.head("#{URL}#{path}").env[:response_headers][:location].should == "#{URL}/about/"
    end
  end
  it 'should get 404 response code' do # don't redirect to a 404
    %w(/foo.html /foo /foo/).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 404
    end
    %w(/img/index.html /img/index /img/index/).each do |path| # /img/index/ will redirect instead of 404
      Faraday.head("#{URL}#{path}").status.should == 404
    end
  end
end
