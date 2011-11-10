require 'faraday'
require 'rspec'

URL = 'http://staging.opennorth.ca'

describe Faraday do
  it 'should get 200 response code' do
    %w(/ /about/).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 200
    end
  end
  it 'should get 301 response code' do
    %w(/index.html /index /index/).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 301
      Faraday.head("#{URL}#{path}").env[:response_headers][:location].should == "#{URL}/"
    end
    %w(/about.html /about).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 301
      Faraday.head("#{URL}#{path}").env[:response_headers][:location].should == "#{URL}/about/"
    end
  end
  it 'should get 404 response code' do
    %w(/foo.html /foo /foo/).each do |path|
      Faraday.head("#{URL}#{path}").status.should == 404
    end
    %w(/img/index.html /img/index /img/index/).each do |path| # /img/index/ will fail
      Faraday.head("#{URL}#{path}").status.should == 404
    end
  end
end
