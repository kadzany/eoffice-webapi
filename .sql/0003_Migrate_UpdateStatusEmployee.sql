update eoffice2.hrms_employees e
left join eoffice.hrms_user u on u.emp_username = e.emp_username
set e.status = u.status