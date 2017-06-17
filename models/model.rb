require 'net/http'
require 'json'
require 'rubygems'
require 'rest-client'

#vimeo api - no longer using
def find_image(search)
    r = RestClient::Request.execute(method: :post,
                            url: "https://api.vimeo.com/oauth/authorize/client",
                            payload: {grant_type: "client_credentials"},
                            user: "95010b42062f3119d09755325af58610e6621ab3",
                            password: "j94HiLP7bOjdNuz/427afyoOdzyfeMukKWongSnLWjM+hnXrNE6/uKRiwwdH8DH52SjHJx6ttFtuso5qTzrPuIl7MxmPcul4HvXi2dXhnFcpPX12Up8h9NJ7yKUISVSd")

    token = JSON.parse(r)["access_token"]
    results = RestClient::Request.execute(method: :get, url: "https://api.vimeo.com/categories/music/videos?query=#{search.gsub(" ","+")}",
                            timeout: 10, headers:  {"Authorization"=>"Bearer #{token}"})
    read_results = JSON.parse(results)
    # read_results["data"][0]["width"] = 640
    # read_results["data"][0]["height"] = 480
    read_results["data"].sample["embed"]["html"]
end


def description(mood)
    if mood == "cheerful"
        "Feeling #{mood}? Listen to this upbeat tune!"
    elsif mood == "mellow"
        "Feeling #{mood}? Chill with this relaxed tune."
    elsif mood == "gloomy"
        "Feeling #{mood}? If you're in need of a good cry, this sad melody takes you right back to the moment you realized love was dead after your parent's divorce."
    elsif mood == "pumped"
        "Feeling #{mood}? This sing-a-long anthem is perfect for anything from your morning run to shower karaoke."
    elsif mood == "angry"
        "Feeling #{mood}? This rockin' song is almost as good as a punching bag."
    elsif mood == "focused"
        "Feeling #{mood}? Bring some energy into your study sesh."
    elsif mood == "smitten"
        "Feeling #{mood}? Here's a song to crush on!"
    elsif mood == "nostalgic"
        "Feeling #{mood}? Throw it back with this decade chart-topper."
    end
end