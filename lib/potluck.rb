class Potluck
  attr_reader :date, :dishes, :menu

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish_instance)
    @dishes << dish_instance
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def menu
    @menu = Hash.new { |h, k| h[k] = [] }
    @dishes.each do |dish|
      @menu[(dish.category.to_s + 's').to_sym] << dish.name
    end
    organize_menu
  end

  def organize_menu
    @menu.map do |key, value|
      @menu[key] = value.sort
    end
    @menu    
  end

  def ratio(course)
    count = 0
    @dishes.each do |dish|
      count +=1 if dish.category == course
    end
      (count / @dishes.count.to_f) * 100
  end











end
