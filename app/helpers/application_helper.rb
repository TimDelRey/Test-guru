module ApplicationHelper
  def current_year
    current_year = Time.now.year
  end

  def github_url(author, repo)
    link_to "Github", "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def custom_pluralize(count, noun)
    vopros = "В данном тесте #{count} #{noun}" # переменная написана транслитом, что бы акцентировать на рускоязычности метода
    if count == 1
      "#{vopros}"
    elsif (2..4).include?(count)
      "#{vopros}а"
    else
      "#{vopros}ов"
    end
  end
end
