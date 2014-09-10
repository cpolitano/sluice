class Query < ActiveRecord::Base

  belongs_to :user
  has_many :tweets, dependent: :destroy
  validates :keyword, presence: true
  validates :user_id, presence: true

  def search_twitter(keyword)
  	consumer_key = OAuth::Consumer.new(ENV['API_KEY'],ENV['API_SECRET'])
    access_token = OAuth::Token.new(ENV['ACESS_TOKEN'],ENV['ACESS_TOKEN_SECRET'])
    baseurl = "https://api.twitter.com"
    path = "/1.1/search/tweets.json"
    search_term = URI.encode_www_form("q" => "#{keyword}")
    address = URI("#{baseurl}#{path}?#{search_term}&count=25")
    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request = Net::HTTP::Get.new address.request_uri
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request
    JSON.parse(response.body)
  end


end
