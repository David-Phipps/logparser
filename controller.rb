class LogParserController

  def initialize
    @log_file = LogFile.new
    @current_view = FileDialogView.new
    @current_view.clear_display
    @current_view.set_cursor
    @current_view.display
  end

  def run
    while user_input = $stdin.getch do
      #beginning of loop will wait for character and assign to user_input.
      #Once that happens the program will execute
      begin
        while next_chars = $stdin.read_nonblock(10) do
          user_input = "#{user_input}#{next_chars}"
        end
      rescue IO::WaitReadable
        #no code here, since the error just means we got
        #all the data
      end
      if @current_view.quittable? && user_input == 'q'
        break
      else
        parse_input user_input
      end
    end

  def parse_input user_input
  when "\n"
    #change controller likely
    #check the view's current interaction
    #index to see what's next_chars
  when "\e[A" #up button
    #up button .. update the view with an up action
  when "\e[B" #down button
    #down
  when "\e[C"
    #right
  when "\e[D"
    #left
  else
    #send other input to a select input field
  end
end





class FileDialogView
  def quittable
    true
  end
end


end
