require 'spec_helper'

describe StatEntry do
  before :each do
    @link=FactoryGirl.create(:link)
    @stat_entry=FactoryGirl.create(:stat_entry)
  end

  it 'should build it self from a hash with proper data' do
    request_env_hash_keys = [
      'QUERY_STRING',
      'REMOTE_ADDR',
      'REMOTE_HOST',
      'REQUEST_METHOD',
      'REQUEST_URI',
      'HTTP_ACCEPT',
      'HTTP_USER_AGENT',
      'HTTP_ACCEPT_ENCODING',
      'HTTP_ACCEPT_LANGUAGE',
      'HTTP_COOKIE',
      'HTTP_VERSION',
      'OTHER1',
      'OTHER2',
      'OTHER3'
    ]

    request_env_hash = {}
    request_env_hash_keys.each do |key|
      request_env_hash[key] = key.downcase
    end

    stat_entry = StatEntry.build_from_hash(request_env_hash, @link)

    attrs_to_check = stat_entry.attributes.keys - ['id', 'link_id', 'created_at', 'updated_at', 'http_cookie']
    attrs_to_check.each do |attr|
      stat_entry.send(attr).should == request_env_hash[attr.upcase] # or just '== attr'
    end
  end

end
