 Here's the correct Ruby code :

require 'net/http' 

require 'uri' 

require 'json' 

require 'rubygems' 

 

@app.on_message(filters.command("chat")) 

async def gpt(app, message) 

  if message.chat.type == "private" 

    txt = await message.reply("Generating...") 

    if message.command.length < 2 

      await txt.edit("Give me a query too") 

      return 

    end 

    query = message.text.gsub("/chat", "") 

    url = URI.parse("https://api.safone.me/chatgpt") 

    payloads = { 

      "message": query, 

      "chat_mode": "assistant", 

      "dialog_messages": "[{\"bot\":\"\",\"user\":\"\"}]" 

    } 

    headers = {"Content-Type" => "application/json"} 

    http = Net::HTTP.new(url.host, url.port) 

    http.use_ssl = true 

    request = Net::HTTP::Post.new(url.request_uri, headers) 

    request.body = payloads.to_json 

    begin 

      response = http.request(request) 

      results = JSON.parse(response.body) 

      res = results["message"] 

      await txt.edit("#{res}") 

    rescue Exception => e 

      await txt.edit("Error :-\n#{e}") 

    end 

  else 

    txt = await message.reply("Generating...") 

    if message.command.length < 2 

      await txt.edit("Give me a query too") 

      return 

    end 

    query = message.text.gsub("/chat", "") 

    url = URI.parse("https://api.safone.me/chatgpt") 

    payloads = { 

      "message": query, 

      "chat_mode": "assistant", 

      "dialog_messages": "[{\"bot\":\"\",\"user\":\"\"}]" 

    } 

    headers = {"Content-Type" => "application/json"} 

    http = Net::HTTP.new(url.host, url.port) 

    http.use_ssl = true 

    request = Net::HTTP::Post.new(url.request_uri, headers) 

    request.body = payloads.to_json 

    begin 

      response = http.request(request) 

      results = JSON.parse(response.body) 

      res = results["message"] 

      await txt.edit("#{res}") 

    rescue Exception => e 

      await txt.edit("Error :-\n#{e}") 

    end 

  end 

end
