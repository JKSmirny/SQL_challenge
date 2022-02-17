--8. In descending order, list the frequency count of employee 
--last names,i.e., how many employees share each last name.
select last_name, COUNT(last_name)as frequency
from employees
group by last_name
order by COUNT(last_name) desc;