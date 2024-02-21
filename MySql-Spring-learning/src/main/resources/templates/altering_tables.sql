select * from diary_logs;
alter table diary_logs add emotion text;
select * from diary_logs;
insert into diary_logs (user_id, date, content, emotion) VALUES (1, '20-02-2024', 'after run', 'happy');
select * from diary_logs;
update diary_logs set diary_logs.emotion = 'concentration' where id = 2;
select * from diary_logs;