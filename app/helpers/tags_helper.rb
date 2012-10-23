module TagsHelper
  def strip_comma(str)
    !str.nil? ? str.replace(",") :nil
  end


  def username_match(str)
    return username_match = str.match(/\@[\w,]+/)
  end

  def hashtag_match(str)
    return hashtag_match = str.match(/\#[\w,]+/)
  end

  def status_parser(str)
      text = str
      text = text.gsub('&#x27;', "'")
     newtext = ""
     text = text.split(" ")
     text.each do |word|
       a = username_match(word)
       b = hashtag_match(word)
         if (a)
                tempstring = a.to_s
                   tempstring.slice!("@")
                  tempstring2 = tempstring.gsub(/,/, '')

                  linktext = (link_to word, tempstring2).html_safe
                   newtext+= '<span class="link_to_user">' + linktext + '</span>'


         elsif (b)
                   hashtempstring =  b.to_s
                   hashtempstring.slice!("#")
                   hashtempstring2 = hashtempstring.gsub(/,/, '')
                   linktext = (link_to word, 'hash/' + hashtempstring)
                  newtext += '<span class="link_to_hashtag">'
                   newtext+= '<span class="link_to_hashtag">' + linktext + '</span>'
                   newtext+=    '</span>'
              else
                   newtext +=  word.to_s
         end
               newtext += " "


     end
      return newtext.html_safe
end

      def go_through_status(str)
      newtext=""
     text = str.split(" ")
     text.each do |word|
            a = username_match(word)
            b = hashtag_match(word)
         if (a)
              tempstring = a.to_s
              tempstring.slice!("@")
              myuser = User.find_by_username(tempstring)
              b = myuser
                     #newtext += username_match.to_s
                 c = link_to "@" + tempstring, tempstring
                 newtext  += c.html_safe
             elsif (b)
                    newtext +=  b.to_s
             else
              newtext +=  word.to_s
           end
     end
    return newtext
    end
  end