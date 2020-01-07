module Posts::SearchesHelper
require 'mechanize'
    def title(article)
        title = article.at('a').inner_text
    end
    def url(article)
        url = article.at('a')[:href]
    end
end
