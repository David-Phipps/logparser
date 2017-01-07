require 'io/console'
class BasicView

  def clear_display
    print "\e[2J"
  end

  def set_cursor row = 1, column = 1
    print "\e[#{row};#{column}H"
  end

  def center text
    columns = $stdin.winsize[1]
    text_length = text.length
    column_locaion = columns /2 -text_length /2
    "\e[#{column_locaion}G#{text}"
  end

  def red text
    "\e[31;40m#{text}\e[0m"
  end
end

class FileDialogView < BasicView

  def quittable?
    true
  end

  def display log_file
    clear_display
    set_cursor
    puts red(center("Slect an Apache log file"))
    log_file.directory.each_with_index do |directory_entry, index|
        puts directory_entry
      end

    set_cursor $stdin.winsize[0], 1
    print red("Type 'q' to exit; up/down to move; return to select")
  end
end

class LogListView < BasicView
end

class SortFilterView < BasicView
end
