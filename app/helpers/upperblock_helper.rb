module UpperblockHelper
  def ribbon_title
    content_tag("h2", class: "text-2xl font-semibold text-gray-900 leading-tight") do
      @title.titleize
    end
  end
end