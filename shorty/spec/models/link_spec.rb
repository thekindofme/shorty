require 'spec_helper'

describe Link do
  before :each do
    @link=FactoryGirl.create(:link)
  end

  it 'should shorten a url' do
    @link.shorten.length.should < @link.url.length
  end

  it 'should not produce a blank shortended url' do
    @link.shorten.should_not eq ''
  end

  it 'should convert a shortended url back to its original form' do
    @link.url.should == Link.reverse(@link.shorten).url
  end

  it 'should always produce Y shortended url whenever X URL is shortended' do
    shortended_url_1 = @link.shorten
    shortended_url_2 = @link.shorten

    shortended_url_1.should == shortended_url_2
  end

end
