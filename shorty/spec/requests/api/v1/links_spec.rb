# spec/requests/api/v1/links_spec.rb
describe "Link Shortening API" do
  it 'retrieves a specific link' do
    link = FactoryGirl.create(:link)
    get "/links/#{link.id}.json"

    expect(response).to be_success
    expect(json['url']).to eq(link.url)
  end

  it 'shortens a given link' do
    url = 'http://www.google.com'

    post "/shorten.json", link: { url: url }

    expect(response).to be_success
    expect(json['url']).to eq(url)
    expect(json['shortended_url']).to eq(Link.last.shortended_url)
  end
end
