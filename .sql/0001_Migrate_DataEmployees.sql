insert into eoffice2.hrms_employees (emp_id, emp_firstname, emp_lastname, emp_gender, emp_dob, emp_street, emp_email, emp_cutah, emp_trip, emp_cubes, emp_job, job_code, pic_url, emp_password, emp_username, emp_role)
select u.emp_id, emp_firstname, emp_lastname, emp_gender, emp_dob, emp_street, emp_email, emp_cutah, emp_trip, emp_cubes, NULL, job_code, pic_url, emp_password, emp_username,  NULL  from eoffice.hrms_user u join eoffice.hrms_employees e on u.emp_id = e.emp_num;

