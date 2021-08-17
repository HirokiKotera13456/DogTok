class SearchController < ApplicationController
  
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @value)
  end
  

  
  private
  
  def match(model,value)
    if model == 'user'
      User.where(name: value)
    elsif model == 'dog'
      Dog.where(name: value)
    end
  end
  
  def forward(model,value)
    if model == 'user'
      User.where("name LIKE ?", "#{value}%")
    elsif model == 'dog'
      Dog.where("name LIKE ?", "#{value}%")
    end
  end
  
  def backward(model,value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'dog'
      Dog.where("name LIKE ?", "%#{value}")
    end
  end
  
  def partical(model,value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'dog'
      Dog.where("name LIKE ?", "%#{value}")
    end
  end
  
  def search_for(how, model, value)
    case how
    when 'match'
      match(model, value)
    when 'forward'                        #例えばhowがmatchの場合は def match の処理に進みます
      forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
    end
  end
  
end
