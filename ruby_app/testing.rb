require 'rspec/autorun'
require_relative 'main.rb'

describe FileParser do
  it 'checks if the parsing onewebserver.log works as expected' do
    parse = FileParser.new
    expect(parse.file_to_hash('onewebserver.log')).to eq('/home' => ['235.313.352.950'])
  end

  it 'tests tenwebserver.log file_to_hash method from fileparser.rb' do
    parse = FileParser.new
    expect(parse.file_to_hash('tenwebserver.log'))
      .to eq('/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],
             '/contact' => ['184.123.665.067'],
             '/home' => ['184.123.665.067', '235.313.352.950'],
             '/about/2' => ['444.701.448.104'],
             '/index' => ['444.701.448.104'],
             '/about' => ['061.945.150.735'])
  end

  it 'tests most_views method using onewebserver.log' do
    parse = FileParser.new
    parse.file_to_hash('onewebserver.log')
    expect(parse.most_views).to eq('/home 1 visits.')
  end

  it 'tests unique_views method using onewebserver.log' do
    parse = FileParser.new
    # parse.file_to_hash('onewebserver.log')
    expect(parse.unique_views).to eq('/home 1 unique views.')
  end
end
