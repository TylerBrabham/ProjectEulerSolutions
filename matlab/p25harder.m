function [] = problem25harder(digits)
% Calculate fibonacci numbers by doing the standard addition algorithm on a 
% vector. When the first element in the vector is non zero, then we have the 
% first fibonacci number with digits elements. This solution ends up being pretty
% slow, but is kind of fun to write.

disp(fib_digits(digits));

end % end main function

function n = fib_digits(digits)
% return the value n for which the nth fibonacci number has the requested 
% digits.

desired_fib = zeros(1, digits);
a = zeros(1, digits);

desired_fib(digits) = 1;
n = 1;
while desired_fib(1) == 0
	temp = desired_fib;
	desired_fib = my_add(desired_fib, a, digits);
	a = temp;
	n = n + 1;
end

end % end subfunction fib_digits

function z = my_add(x, y, digits)
% Add y to x, and return the result as as z.
z = zeros(1, digits);

carry = 0;
for ii = digits:-1:1
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