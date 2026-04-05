drop table if exists note_tags;
drop table if exists Folders;
drop table if exists Tags;
drop table if exists Notes;
drop table if exists Users;

create table if not exists Users (
	id bigint generated always as identity primary key,
	email text not null unique, 
	password_hash text not null,
	created_at timestamp default now()
);

create table if not exists Folders (
	id bigint generated always as identity primary key,
	name text not null,
	user_id bigint references Users(id) on delete cascade,
	unique (user_id, name)
);

create table if not exists Tags (
	id bigint generated always as identity primary key,
	name text not null unique
);

create table if not exists Notes (
	id bigint generated always as identity primary key,
	title text not null,
	content text,
	is_pinned boolean default false,
	created_at timestamp default now(),
	updated_at timestamp,
	user_id bigint references Users(id) on delete cascade,
	folder_id bigint references Folders(id) on delete set null
);

create table if not exists note_tags (
	note_id bigint references Notes(id) on delete cascade,
	tag_id bigint references Tags(id) on delete cascade,
	primary key (note_id, tag_id)
);
