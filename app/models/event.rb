class Event
  attr_reader :event_type, :actor, :repo, :time

  def initialize(attributes={})
    @event_type = attributes[:type]
    @actor = attributes[:actor][:login]
    @repo = attributes[:repo][:name]
    @time = attributes[:created_at]
  end

  def self.received_by_user(token, username)
    events = GithubService.new(token)
    mapped = events.get_received_events(username).map do |event|
      Event.new(event)
    end
    mapped.sort! { |a,b| b.time <=> a.time }
  end

  def self.performed_by_user(token, username)
    events = GithubService.new(token)
    mapped = events.get_performed_events(username).map do |event|
      Event.new(event)
    end
    binding.pry
    mapped.sort! { |a,b| b.time <=> a.time }
  end
end
