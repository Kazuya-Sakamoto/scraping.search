class Posts::SearchesController < ApplicationController
  def index
    @posts = Post.search(params[:keyword])
    require 'mechanize'
    # class Scraping
      def scrape(search)
        articles = []
        agent = Mechanize.new
        current_page = agent.get("https://news.yahoo.co.jp/topics")
        elements = current_page.search('.topicsListItem')
        elements.each do |ele|
          title = ele.at('a').inner_text
          # url = e.at('a')[:href]
          if title.match(/.+#{search}/) == nil
          else
            articles << ele
          end
        end
        return articles
      end
    @articles = scrape(params[:keyword])
  end
end
