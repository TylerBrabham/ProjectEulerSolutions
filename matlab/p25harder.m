function [] = problem25harder()
% Calculate fibonacci numbers by doing the standard addition algorithm on a 
% vector. When the first element in the vector is non zero, then we have the 
% first fibonacci number with 1000 elements. This solution ends up being pretty
% slow, but is kind of fun to write.

disp(fib_digits(1000));

end % end main function

function n = fib_digits(digits)
% return the value n for which the nth fibonacci number has the requested 
% digits.

desired_fib = zeros(1, 1000);
a = zeros(1, 1000);

desired_fib(1000) = 1;
n = 1;
while desired_fib(1) == 0
	temp = desired_fib;
	desired_fib = my_add(desired_fib, a);
	a = temp;
	n = n + 1;
end

end % end subfunction fib_digits

function z = my_add(x, y)
% Add y to x, and return the result as as z.
z = zeros(1, 1000);

carry = 0;
for ii = 1000:-1:1
	cur_digit = carry + x(ii) + y(ii);
	if cur_digit >= 10
		carry = 1;
		cur_digit = cur_digit - 10;
	else
		carry = 0;
	end

	z(ii) = cur_digit;
end

end % end subfunction add