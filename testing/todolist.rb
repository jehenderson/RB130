# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end

  def each
    counter = 0
    while todos.size < counter
      yield(self.todos[counter])
      counter += 1
    end
    self
  end

  def select
    counter = 0
    new_list = TodoList.new("selected")
    while counter < todos.size
      if yield(todos[counter])
        new_list << todos[counter]
      end
      counter += 1
    end
    new_list
  end

  def find_by_title(search_title)
    # takes a string as argument, and returns the first 
    # Todo object that matches the argument. Return nil if no todo is found.
    select { |todo| todo.title == search_title }.first
  end

  def all_done
    # returns new TodoList object containing only the done items
    select { |todo| todo.done? }
  end

  def all_not_done
    # returns new TodoList object containing only the not done items
    select { |todo| !todo.done }
  end

  def mark_done(mark_it)
    # takes a string as argument, 
    # and marks the first Todo object that matches the argument as done.
    find_by_title(mark_it).done!
  end

  def mark_all_done
    # mark every todo as done
    each { |todo| todo.done! } 
  end

  def mark_all_undone
    # mark every todo as not done
    each { |todo| todo.undone! } 
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!
results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect


# # given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# #list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# #to_a
# list.to_a                      # returns an array of all items in the list

# #done?
# list.done?                     # returns true if all todos in the list are done, otherwise false                         

# # ---- Retrieving an item in the list ----

# # item_at
# #list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# #list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# #list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# #list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# #list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# #list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# #list.shift                      # removes and returns the first item in list

# # pop
# #list.pop                        # removes and returns the last item in list

# # remove_at
# #list.remove_at                  # raises ArgumentError
# #list.remove_at(1)               # removes and returns the 2nd item
# #list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym