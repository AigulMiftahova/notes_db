--Все заметки пользователя 'alice@example.com', отсортированные по дате по убыванию.
select title, content, created_at from notes n
where user_id = (select id from users where email = 'alice@example.com')
order by created_at desc;

--Только закреплённые заметки, у которых есть тег 'work'.
select title, content from notes n
where is_pinned = true and
id in (select note_id from note_tags nt
where tag_id = (select id from tags where name = 'work'));

--Количество заметок каждого пользователя.
select u.email, count(*) as count_of_notes from notes n
join users u on n.user_id = u.id
group by u.email
order by count_of_notes;

--Все заметки, которые находятся не в папках, отсортированные по названию заметки.
select title, content, folder_id from notes n
where folder_id is null
order by title;

--Топ-3 самых используемых тегов (по количеству заметок).
select t.name, count(*) as count_of_usage from note_tags n
join tags t on n.tag_id = t.id
group by t.name
order by count_of_usage desc
limit 3;

--Все заметки с их тегами (если тегов нет — заметка показывается все равно)
select n.title, n.content, string_agg(t.name, ', ') from notes n
join note_tags n_t on n.id = n_t.note_id
join tags t on n_t.tag_id = t.id
group by n.id, n.title, n.content;



