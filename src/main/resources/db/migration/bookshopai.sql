-- ...existing code...

/*
  SQL initialization script for Bookshop AI (PostgreSQL)
  - Creates tables: author, genre, book, description
  - Adds basic constraints, indexes and sample seed data
  - Tiếng Việt: Tạo bảng tác giả, thể loại, sách, mô tả; ràng buộc và dữ liệu mẫu
*/

BEGIN;

-- Author table (Tác giả)
CREATE TABLE IF NOT EXISTS author (
  id SERIAL PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Genre table (Thể loại)
CREATE TABLE IF NOT EXISTS genre (
  id SERIAL PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Book table (Sách)
CREATE TABLE IF NOT EXISTS book (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL REFERENCES author(id) ON DELETE RESTRICT,
  genre_id INT NOT NULL REFERENCES genre(id) ON DELETE RESTRICT,
  isbn VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_book_title ON book(title);

-- Description table (Phiên bản mô tả)
-- status: 1 = active (hiển thị), 0 = inactive (không hiển thị)
-- is_selected: đánh dấu phiên bản được người dùng chọn (TRUE/FALSE)
CREATE TABLE IF NOT EXISTS description (
  id SERIAL PRIMARY KEY,
  book_id INT NOT NULL REFERENCES book(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  keywords VARCHAR(255),
  created_by VARCHAR(100), -- lưu username hoặc user id (tùy chọn)
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status INT DEFAULT 1 CHECK (status IN (0,1)),
  is_selected BOOLEAN DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS idx_description_book ON description(book_id);
CREATE INDEX IF NOT EXISTS idx_description_selected ON description(book_id, is_selected);

-- Optional: ensure at most one selected description per book
CREATE OR REPLACE FUNCTION enforce_single_selected() RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.is_selected) THEN
    -- set others to false
    UPDATE description SET is_selected = FALSE
      WHERE book_id = NEW.book_id AND id <> NEW.id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_single_selected ON description;
CREATE TRIGGER trg_single_selected
  BEFORE INSERT OR UPDATE ON description
  FOR EACH ROW EXECUTE FUNCTION enforce_single_selected();

-- Sample seed data (tùy chọn, có thể xóa)
INSERT INTO author (author_name) VALUES
  ('Nguyen Van A') ON CONFLICT DO NOTHING,
  ('Jane Doe') ON CONFLICT DO NOTHING;

INSERT INTO genre (genre_name) VALUES
  ('Fiction') ON CONFLICT DO NOTHING,
  ('Technology') ON CONFLICT DO NOTHING;

-- Example books
INSERT INTO book (title, author_id, genre_id, isbn)
SELECT 'Learning Java', a.id, g.id, '978-1-23456-789-0'
FROM author a, genre g
WHERE a.author_name = 'Jane Doe' AND g.genre_name = 'Technology'
ON CONFLICT DO NOTHING;

INSERT INTO book (title, author_id, genre_id, isbn)
SELECT 'Tales of VN', a.id, g.id, '978-0-98765-432-1'
FROM author a, genre g
WHERE a.author_name = 'Nguyen Van A' AND g.genre_name = 'Fiction'
ON CONFLICT DO NOTHING;

-- Example description for a book (if book exists)
INSERT INTO description (book_id, content, keywords, created_by, status, is_selected)
SELECT b.id,
       'An introductory book about Java programming, covering basics to advanced topics.',
       'java,programming,beginner',
       'system',
       1,
       TRUE
FROM book b
WHERE b.title = 'Learning Java'
ON CONFLICT DO NOTHING;

COMMIT;
