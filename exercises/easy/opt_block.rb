def compute
  yield if block_given?
  "Does not compute."
end