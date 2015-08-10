# spec/requests/api/v1/stat_entry_spec.rb
describe "Stats API" do
  before :each do
    @link=Link.create(url: 'http://www.google.com/')
  end

  it 'should create a stats entry when a shortenend link is accessed' do
    expect{get @link.shortended_url}.to change { StatEntry.count }.by(1)
  end

  it 'a stats entry should have the expected fields' do
    get @link.shortended_url
    get "stats/#{@link.shorten}.json"

    se = @link.stat_entries.first

    json_response = JSON.parse(response.body)

    json_response.count.should == 1

    %w(query_string remote_addr remote_host request_method request_uri http_accept http_user_agent http_accept_encoding http_accept_language http_version).each do |attr|
      json_response.first[attr].should == se[attr]
    end

    Time.zone.parse(json_response.first['created_at']).should == se['created_at']
  end

  it 'should list all stats entries for a given shortenend link' do
    # this should create 10 entries
    10.times do
      get @link.shortended_url
    end

    get "stats/#{@link.shorten}.json"

    JSON.parse(response.body).count.should == 10
  end
end
