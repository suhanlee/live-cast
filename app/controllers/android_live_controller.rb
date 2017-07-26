class AndroidLiveController < AndroidAbstractController

  PRD_SERVER_HOST_ADDRESS = 'prd_server_addres'
  DEV_SERVER_HOST_ADDRESS = 'http://localhost'

  def create
    room_name = params[:room_name]
    if room_name.nil?
      raise Exceptions::ParameterNotFulfilled
    end

    @room = Room.create(room_name: room_name)
    live_server = LIVE_SERVER::LiveServer.new(@room.id)
    res = live_server.create_application
    if !res.code.eql? 201
      raise Exceptions::CannotCreateRoom
    end

    live_url = live_server.make_live_url
    @room.stream_url = live_url
    @room.app_name = @room.id
    @room.save
  end

  def delete
    @movie_id = params[:movie_id]
    movie = Room.find(@movie_id)
    if movie.nil?
      raise Exceptions::ParameterNotFulfilled
    end

    app_name = movie.app_name
    unless app_name.nil?
      live_server = LIVE_SERVER::LiveServer.new(app_name)
      res = live_server.delete_application
      if !res.code.eql? 200
        raise Exceptions::CannotDeleteApplication
      end
    end

    movie.delete
  end
end
