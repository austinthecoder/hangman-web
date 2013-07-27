class SessionGame
  def self.start(session)
    save session, Hangman.new_game
  end

  def self.current(session)
    Marshal.load session[:game]
  end

  def self.save(session, game)
    session[:game] = Marshal.dump(game)
  end
end