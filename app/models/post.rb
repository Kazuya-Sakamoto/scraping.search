class Post < ApplicationRecord

  require 'mechanize'
  class Scraping
    articles = []
    def scrape(search)
      agent = Mechanize.new
      current_page = agent.get("https://news.yahoo.co.jp/topics")
      elements = current_page.search('.topicsListItem')
      elements.each do |e|
        title = e.at('a').inner_text
        # url = e.at('a')[:href]
        match_keyword(title, search, e)
      end
      return articles
    end

    def match_keyword(title, search, element)
      unless title.match(/.+#{search}/) == nil
        articles << element
      end
    end
  end

  # url = 'https://www.yahoo.co.jp/'
  
  # def scrape(search)
  #   charset = nil
  #   html = open(url) do |f|
  #     charset = f.charset # 文字種別を取得
  #     f.read # htmlを読み込んで変数htmlに渡す
  #   end
  #   doc = Nokogiri::HTML.parse(html, nil, charset)
  #   binding.pry
  #   doc.xpath('//div[@class="topicsListItem"]').each do |node|
  #     p node.css('h3').inner_text
  #   end
  #   title = doc.title.to_s
  #   self.title = title
  # end

  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, length: { in: 1..1000 }, presence: true

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
