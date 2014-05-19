#!/Users/ross/.rvm/rubies/ruby-1.9.3-p327/bin/ruby

#this is a script I run when I feel like procrastinating.
#Before, I would go straight to twitter,
#now I have a 6/7 chance of doing something else

def pause_music
  #pause itunes - yanked from https://github.com/sunny/anyplayer/blob/master/lib/anyplayer/players/itunes_mac.rb
  %x(osascript -e 'tell app "iTunes" to pause').rstrip
  #pause Spotify
  %x(osascript -e 'tell app "Spotify" to pause').rstrip
end

def play_video_from_dir dir
  pause_music

  videos = Dir[dir]
  random_number = rand(videos.count)
  videos[random_number]
end

chamber = rand(7)

file_or_url = case chamber
              when 0
                "https://twitter.com"
              when 1
                "/Users/ross/Documents/media_backup_1114/media/tech/books/practical-vim_p1_0.pdf"
              when 2
                "/Users/ross/Documents/media_backup_1114/media/tech/books/programming-ruby-1-9-2-0_b2_0.pdf"
              when 3
                play_video_from_dir "/Users/ross/Documents/Ruby_Tapas/*"
              when 4
                play_video_from_dir "/Users/ross/Documents/DAS/DAS/*"
              when 5
                "http://www.codewars.com/dashboard"
              when 6
                "https://www.instapaper.com"
              else
                #this should never get hit if I did my math right
                "http://calmingmanatee.com"
              end

system %{open "#{file_or_url}"}
