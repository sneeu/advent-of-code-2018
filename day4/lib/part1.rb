require 'date'

Event = Struct.new(:guard, :start, :stop) do
  def duration
    return (stop - start) / 60
  end

  def minutes
    start.min...stop.min
  end
end

class LogParser
  attr :guard, :start

  def parse_line(line)
    timestamp_extra = /\[(\d+{4})-(\d\d)-(\d\d) (\d\d):(\d\d)\] (.*)/.match(line)
    timestamp = build_timestamp(timestamp_extra[1..5])
    extra = timestamp_extra[6]

    if extra == 'falls asleep'
      @start = timestamp
      return nil
    elsif extra == 'wakes up'
      return Event.new(@guard, @start, timestamp)
    else
      @guard = /(\d+)/.match(extra)[0].to_i
      return nil
    end
  end

  def build_timestamp(ts)
    Time.new(*(ts.map &:to_i))
  end
end

class Log
  def initialize
    @durations = Hash.new 0
    @events = Hash.new { [] }
  end

  def add_event(event)
    @events[event.guard] = @events[event.guard].push(event)
    @durations[event.guard] += event.duration
  end

  def peak_sleeper
    @durations.to_a
              .sort { |a, b| a.last <=> b.last }
              .last
              .first
  end

  def peak_minute_for_sleeper(guard)
    minutes = Hash.new 0
    @events[guard].each do |event|
      event.minutes.each do |m|
        minutes[m] += 1
      end
    end
    minutes.to_a.sort { |a, b| a.last <=> b.last }
           .last
           .first
  end

  def peak_sleep
    sleeper = peak_sleeper

    sleeper * peak_minute_for_sleeper(sleeper)
  end
end

def peak_sleep(lines)
  log_parser = LogParser.new
  log = Log.new

  lines.map { |line| log_parser.parse_line(line) }
       .compact
       .each { |event| log.add_event(event) }

  log.peak_sleep
end

def main(filename)
  peak_sleep(File.open(filename).readlines.sort)
end

