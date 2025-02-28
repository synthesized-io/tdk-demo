-- TODO: https://github.com/synthesized-io/tdk/issues/5860
-- TODO: https://github.com/synthesized-io/tdk/issues/2228#issuecomment-1752025347
alter table TEST.FILM_CATEGORY drop constraint PK_FILM_CATEGORY;
alter table TEST.FILM_ACTOR drop constraint PK_FILM_ACTOR;
-- TODO: https://github.com/synthesized-io/tdk/issues/5890
alter table TEST.STORE drop constraint FK_STORE_STAFF;