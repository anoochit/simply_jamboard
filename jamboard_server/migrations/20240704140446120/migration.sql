BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "user_stream" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_stream" (
    "id" bigserial PRIMARY KEY,
    "boardId" bigint NOT NULL,
    "userInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_stream_unique_idx" ON "user_stream" USING btree ("boardId", "userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_stream"
    ADD CONSTRAINT "user_stream_fk_0"
    FOREIGN KEY("boardId")
    REFERENCES "board"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_stream"
    ADD CONSTRAINT "user_stream_fk_1"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR jamboard
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('jamboard', '20240704140446120', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240704140446120', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_chat
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_chat', '20240115074243685', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074243685', "timestamp" = now();


COMMIT;
