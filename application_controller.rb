require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  post '/results' do
    moods = { 
              "cheerful" => ["https://www.youtube.com/embed/iPUmE-tne5U", "https://www.youtube.com/embed/7QdcnSPrwLc", "https://www.youtube.com/embed/7gPD7kY1amE", "https://www.youtube.com/embed/y6Sxv-sUYtM", "https://www.youtube.com/embed/i8v5xAZyedU", "https://www.youtube.com/embed/uBudLS8QX-I?ecver=2", "https://www.youtube.com/embed/y9OGJQNWOGo?ecver=2", "https://www.youtube.com/embed/BzE1mX4Px0I?ecver=2", "https://www.youtube.com/embed/cwLRQn61oUY?ecver=2","https://www.youtube.com/embed/IyVPyKrx0Xo", "https://www.youtube.com/embed/nfWlot6h_JM?ecver=2", "https://www.youtube.com/embed/b7k0a5hYnSI?ecver=2","https://www.youtube.com/embed/Fp15kxAE3ig"],
    
              "mellow" => ["https://www.youtube.com/embed/by3yRdlQvzs?ecver=2","https://www.youtube.com/embed/w5Pakg-wqnM", "https://www.youtube.com/embed/cUfIKX5ReKQ","https://www.youtube.com/embed/bhZXaWYTPoE", "https://www.youtube.com/embed/rvaJ7QlhH0g?ecver=2", "https://www.youtube.com/embed/Kp7eSUU9oy8?ecver=2", "https://www.youtube.com/embed/KVYup3Qwh8Q", "https://www.youtube.com/embed/LmWBphAf72g?ecver=2", "https://www.youtube.com/embed/BL9jY9b2uFg?ecver=2", "https://www.youtube.com/embed/BiQIc7fG9pA?ecver=2", "https://www.youtube.com/embed/CEvsDuJYEnI?ecver=2","https://www.youtube.com/embed/lur5B3a4_fk"],
              
              "gloomy" => ["https://www.youtube.com/embed/9EzeW5KoPUI", "https://www.youtube.com/embed/qkNa5xzOe5U","https://www.youtube.com/embed/3EL20VKlvbs", "https://www.youtube.com/embed/1aoS2HI5xsk", "https://www.youtube.com/embed/zwFS69nA-1w", "https://www.youtube.com/embed/iUAjdoYQSIY", "https://www.youtube.com/embed/VT1-sitWRtY?ecver=2","https://www.youtube.com/embed/lydBPm2KRaU?ecver=2", "https://www.youtube.com/embed/UAsTlnjvetI","https://www.youtube.com/embed/vnLAa6_hB9A","https://www.youtube.com/embed/VEpMj-tqixs","https://www.youtube.com/embed/eiSzBmyX4eQ"],
              
              "pumped" => ["https://www.youtube.com/embed/5Ifp18Xry68", "https://www.youtube.com/embed/g9N3HGIhYJA", "https://www.youtube.com/embed/XNtTEibFvlQ", "https://www.youtube.com/embed/phr1pOFK1V8", "https://www.youtube.com/embed/5XK4v2fgMPU?ecver=2","https://www.youtube.com/embed/SC4xMk98Pdc?ecver=2","https://www.youtube.com/embed/kJQP7kiw5Fk?ecver=2", "https://www.youtube.com/embed/0Kg9xRooTVk?ecver=2", "https://www.youtube.com/embed/DVkkYlQNmbc", "https://www.youtube.com/embed/ExVtrghW5Y4?ecver=2", "https://www.youtube.com/embed/diW6jXhLE0E?ecver=2","https://www.youtube.com/embed/NLZRYQMLDW4?ecver=2", "https://www.youtube.com/embed/0l9kzS_B7gg?ecver=2"],
              
              "angry" => ["https://www.youtube.com/embed/WaSy8yy-mr8", "https://www.youtube.com/embed/yCMqcFAigRg", "https://www.youtube.com/embed/rlYys58hsCU","https://www.youtube.com/embed/CD-E-LDc384?ecver=2","https://www.youtube.com/embed/O4irXQhgMqg?ecver=2", "https://www.youtube.com/embed/ozLHPsAkphQ", "https://www.youtube.com/embed/Z2x4vY0FrCc?ecver=2", "https://www.youtube.com/embed/PfYnvDL0Qcw?ecver=2", "https://www.youtube.com/embed/YzbY5DSQpHo?ecver=2", "https://www.youtube.com/embed/FJfFZqTlWrQ?ecver=2", "https://www.youtube.com/embed/R7UrFYvl5TE?ecver=2", "https://www.youtube.com/embed/H5NqIsnyTG8", "https://www.youtube.com/embed/tvTRZJ-4EyI?ecver=2"],
              
              "focused" => ["https://www.youtube.com/embed/Rc9EjoZcimo?ecver=2","https://www.youtube.com/embed/OpIQNxiKJoE?ecver=2", "https://www.youtube.com/embed/4Tr0otuiQuU", "https://www.youtube.com/embed/CvFH_6DNRCY", "https://www.youtube.com/embed/fBA-38mzabs", "https://www.youtube.com/embed/mBmCcSz6HWw", "https://www.youtube.com/embed/Eya0aMkAYA0", "https://www.youtube.com/embed/zWR8DmMYwL8", "https://www.youtube.com/embed/Yw3XPeqIVUU", "https://www.youtube.com/embed/FC0zF89uy44", "https://www.youtube.com/embed/ADp9P3p85w0?ecver=2" ],
              
              "smitten" => ["https://www.youtube.com/embed/4Ba_qTPA4Ds", "https://www.youtube.com/embed/AWGqoCNbsvM", "https://www.youtube.com/embed/cjvUzIyDS5s", "https://www.youtube.com/embed/50-_oTkmF5I", "https://www.youtube.com/embed/XWIGu6-r67Y", "https://www.youtube.com/embed/COiIC3A0ROM","https://www.youtube.com/embed/Ju8Hr50Ckwk", "https://www.youtube.com/embed/Ob7vObnFUJc", "https://www.youtube.com/embed/13GD78Bmo8s", "https://www.youtube.com/embed/4k-W6cZ2CiY", "https://www.youtube.com/embed/8wxOVn99FTE","https://www.youtube.com/embed/LjhCEhWiKXk", "https://www.youtube.com/embed/XDsBDG3y0Pg", "https://www.youtube.com/embed/7cOqgarjuRc","https://www.youtube.com/embed/fWNaR-rxAic", "https://www.youtube.com/embed/xGPeNN9S0Fg", "https://www.youtube.com/embed/Vzx6jt3i7g0","https://www.youtube.com/embed/Jb2stN7kH28", "https://www.youtube.com/embed/IWSt64gNr30", "https://www.youtube.com/embed/3A5j1OVoiW4?ecver=2", "https://www.youtube.com/embed/v4pi1LxuDHc"],
              
              "nostalgic" =>["https://www.youtube.com/embed/7mdIWaRi-7c", "https://www.youtube.com/embed/iol0B-clFFM", "https://www.youtube.com/embed/NNmEQpy0Wnc", "https://www.youtube.com/embed/BR2JtsVumFA", "https://www.youtube.com/embed/E6al4UWbbWs", "https://www.youtube.com/embed/xFrGuyw1V8s","https://www.youtube.com/embed/Y0d53KUlTN8?ecver=2", "https://www.youtube.com/embed/djV11Xbc914", "https://www.youtube.com/embed/gDhF-PsDuCw?ecver=2", "https://www.youtube.com/embed/zDlKb2cBAqU?ecver=2", "https://www.youtube.com/embed/w40ushYAaYA?ecver=2",]
    }
    @mood = params[:mood]
    @artist = moods[@mood].sample
    @description = description(@mood)
    # @video = find_image(artist)
    erb :results
  end

end