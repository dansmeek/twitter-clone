module ApplicationHelper
  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
  def remove_special_chars(str)
    str.gsub(/(\W|\d)/, "")
    return str.to_s
  end

end

