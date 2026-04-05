--Добавление тега к заметке по айдишникам
create or replace function add_tag_to_note(p_note_id bigint, p_tag_id bigint) returns void as $$
begin
	insert into note_tags (note_id, tag_id)
	values (p_note_id, p_tag_id)
	on conflict (note_id, tag_id) do nothing;
end;
$$ language plpgsql;

--Получение даты последнего обновления заметки
create or replace function get_last_updated_date_of_note(p_note_id bigint) returns timestamp as $$
declare
	result timestamp;
begin
	select coalesce(updated_at, created_at)
	into result from notes
	where id = p_note_id; 
end;
$$ language plpgsql;

--Перемещение заметки в другую папку
create or replace function move_note_to_another_folder(p_note_id bigint, p_folder_id bigint) returns void as $$
begin
	if not exists (select 1 from folders where id = p_folder_id)
	then raise exception 'Folder not found :(';
	end if;

	update notes
	set folder_id = p_folder_id, updated_at = now()
	where id = p_note_id;

	if not found
	then raise exception 'Note not found :(';
	end if;
end;
$$ language plpgsql;