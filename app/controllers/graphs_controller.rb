class GraphsController < ApplicationController
  before_action :set_user
  before_filter :ensure_owner

  def index
  end

  def time_per_class
    g = Gruff::Pie.new

    g.title = 'Time Per Class'

    @user.klasses.each do |klass|
      g.data klass.name, klass.time_elapsed
    end

    send_graph g, 'time_per_class.png'
  end

  def average_problem_time_per_class
    g = Gruff::Bar.new

    g.title = 'Average Time per Problem'

    averages = @user.klasses.map { |k| k.average_time_per_problem }.inject([]) do |l, a|
      l << a.to_f / 60
    end

    g.data @user.email, averages

    labels = {}

    @user.klasses.each_with_index { |k, i| labels[i] = k.name }

    g.labels = labels

    g.y_axis_label = 'Time (minutes)'

    send_graph g, 'average_time_per_problem.png'
  end

  def average_time_per_assignment
    g = Gruff::Bar.new

    g.title = 'Average Time per Assignment'

    averages = @user.klasses.map { |k| k.average_time_per_assignment }.inject([]) do |l, a|
      l << a.to_f / 60
    end

    g.data @user.email, averages

    labels = {}

    @user.klasses.each_with_index { |k, i| labels[i] = k.name }

    g.labels = labels

    g.y_axis_label = 'Time (minutes)'

    send_graph g, 'average_time_per_assignment.png'
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end

    def send_graph(g, name)
      send_data g.to_blob, disposition: :inline, type: 'image/png', filename: name
    end
end
