function g = sigmoid(z)
  SIGMOID = @(z) 1./(1 + exp(-z));
  g = SIGMOID(z);
end
