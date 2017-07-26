json.feed_list @feeds do |feed|
  json.movie_url feed.stream_url
  json.movie_id feed.id
  json.movie_name feed.room_name
  json.thumb_movie_url 'https://avatars1.githubusercontent.com/u/2666166?v=3&u=e9222752a65412ab2b4a0459fcb2932ae7c7620c&s=400'
end