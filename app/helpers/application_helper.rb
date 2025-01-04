module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow', rel: 'noopener'
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

  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
