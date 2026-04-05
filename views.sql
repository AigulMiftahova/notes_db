--Представление "Пользователь и количество его заметок"
create or replace view user_notes_count
as select u.email, count(*) as count_if_notes
from notes n join users u
on n.user_id = u.id
group by u.email;

select * from user_notes_count unc;

--Представление "Заметки с тегами"
create or replace view notes_with_tags
as select n.title, n.content, string_agg(t.name, ', ') as tags from notes n
join note_tags n_t on n.id = n_t.note_id
join tags t on n_t.tag_id = t.id
group by n.id, n.title, n.content;

select * from notes_with_tags;