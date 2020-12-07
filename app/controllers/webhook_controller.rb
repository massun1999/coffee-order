class WebhookController < ApplicationController
  require 'line/bot'

  protect_from_forgery except: [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          if event.message['text'].include?('注文')
            @user = event['source']['userId']
            message = {
              type: 'template',
              altText: 'Carousel alt text',
              template: {
                type: 'carousel',
                columns: [
                  {
                    thumbnailImageUrl: "https://drive.google.com/file/d/1eFp0rk20kpUylUmKJBrca9risAGlyExl/view?usp=sharing.JPG",
                    title: 'Latte',
                    text: "espresso and steamed milk\n price: ¥500",
                    actions: [
                      { label: 'Order', type: 'uri', uri: 'https://reserve-systembot1999.herokuapp.com/lattes/new' }
                    ]
                  },
                  {
                    thumbnailImageUrl: "https://drive.google.com/file/d/1j-mp1bHWlAQ5FyM_0GVh05RCjduw4u0t/view?usp=sharing.JPG",
                    title: 'Pure Over',
                    text: "Filter Coffee\n price: ¥450",
                    actions: [
                      { label: 'Choise', type: 'uri', uri: 'https://reserve-systembot1999.herokuapp.com/filters/new'}
                    ]
                  }
                ]
              }
            }
            client.reply_message(event['replyToken'], message)
          end
        end
      when Line::Bot::Event::Follow
        @user = event['source']['userId']
        User.find_or_create_by(user_id: @user)
      end
    end

    "OK"
  end
end
