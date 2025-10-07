# Write your MySQL query statement below
select S.student_id ,S.student_name ,SU.subject_name ,COUNT(E.student_id) attended_exams
from students S CROSS JOIN  Subjects SU left join Examinations E on S.student_id=E.student_id and SU.subject_name=E.subject_name GROUP BY S.student_id, S.student_name, SU.subject_name
ORDER BY S.student_id, S.student_name, SU.subject_name
