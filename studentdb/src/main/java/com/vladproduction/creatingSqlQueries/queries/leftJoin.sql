select b.title, s.name from book b left join students s on b.id_student = s.id;