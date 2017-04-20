module ApplicationHelper
    def googlemap(shops)
         Gmaps4rails.build_markers(shops) do |shop, marker|
            marker.lat shop.latitude
            marker.lng shop.longitude
            marker.infowindow render(:partial => "shops/shop_infowin", :locals => {:shop => shop})
            marker.picture ({
                url: image_path('pin_icon.png'),
                width: 30,
                height: 30
            })
        end
    end

    def cut_text(text, len)
      if text !=nil
        if text.length < len
          text
        else
          text.scan(/^.{#{len}}/m)[0] + "..."
        end
      else
        ''
      end
    end
end
